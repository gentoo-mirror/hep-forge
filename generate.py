# list all files

import os

def list_files(path):
    files = []
    for name in os.listdir(path):
        if os.path.isfile(os.path.join(path, name)):
            files.append(name)
    return files

# find all files in **/**/*.ebuild
def find_ebuild(path):
    ffiles = []
    for root, dirs, files in os.walk(path):
        print(files)
        for file in files:
            if file.endswith(".ebuild") and not ".git" in root:
                ffiles.append(os.path.join(root, file))
    return ffiles

def get_ebuild_split():
    lists = []
    path = os.getcwd()
    files = find_ebuild(path)
    for file in files:
        file = file.replace(path + "/","")
        sl = file.split("/")
        assert len(sl) == 3
        sl[2] = sl[2].replace(".ebuild","").replace(sl[1] + "-","")
        lists.append(sl)
    return lists

def get_ebs_with_arch():
    ebs = get_ebuild_split()
    rebs = []
    for eb in ebs:
        path = eb[0] + "/" + eb[1] + "/" + eb[1] + "-" + eb[2] + ".ebuild"
        print(path)
        assert os.path.isfile(path)
        # grep file for amd64, arm64, arm, riscv
        with open(path) as f:
            for line in f:
                if "KEYWORDS" in line:
                    hit = False
                    if "amd64" in line:
                        rebs.append(eb + ["amd64"])
                        hit = True
                    if "arm64" in line:
                        rebs.append(eb + ["arm64"])
                        hit = True
                    if "arm" in line:
                        rebs.append(eb + ["arm"])
                        hit = True
                    if "riscv" in line:
                        rebs.append(eb + ["riscv"])
                        hit = True
                    if hit:
                        break
    return rebs

def merge_ebs():
    """
    ebs = [["category", "package", "version", "arch"],["category", "package", "version", "arch2"]]
    to 
    ebs = [["category", "package", "version", ["arch", "arch1"]]]

    and 
    """
    ebs = get_ebs_with_arch()
    rebs = []
    for eb in ebs:
        found = False
        for reb in rebs:
            if eb[0] == reb[0] and eb[1] == reb[1]:
                reb[2].append(eb[2])
                reb[3].append(eb[3])
                found = True
                break
        if not found:
            rebs.append([eb[0], eb[1], [eb[2]], [eb[3]]])
    # now remove duplucate versions and arch
    for reb in rebs:
        reb[2] = list(set(reb[2]))
        reb[3] = list(set(reb[3]))
    return rebs

def generate_jobs():
    ebs = merge_ebs()
    gitlabjobs = []
    for eb in ebs:
        arch = eb[3]
        name = eb[0] + "-" + eb[1] 
        #name = name.replace(".","-").replace("_","-")
        #bdep = "\n    needs: [" +eb[1] + "-" + eb[2] + "-" + "amd64" + "]"
        #if arch == "amd64":
        #    bdep = ""
        gitlabjob = f"""
.var_{name}: &var_{name}
    parallel:
        matrix:
            - PKG: {eb[1]}
              CATEGORY: {eb[0]}
              VERSION: {eb[2]}
              ARCH: {eb[3]}
              IMAGE: apnpucky/gentoo-hep-forge:latest
filter_{name}_rest:
    <<: *var_{name}
    extends: .filter_rest
filter_{name}_amd64:
    <<: *var_{name}
    extends: .filter_amd64
    """
        gitlabjobs.append(gitlabjob)
    return gitlabjobs


def main():
    r = generate_jobs()
    print(r)
    # rm tmp file
    if os.path.isfile("tmp.gitlab-ci.yml"):
        os.remove("tmp.gitlab-ci.yml")
    # copy base file
    with open(".gitlab-ci.trigger.yml", "r") as f:
        for line in f:
            with open("tmp.gitlab-ci.yml", "a") as f:
                f.write(line)
    # write to file
    for i in r:
        with open("tmp.gitlab-ci.yml", "a") as f:
            f.write(i)

if __name__ == '__main__':
    main()