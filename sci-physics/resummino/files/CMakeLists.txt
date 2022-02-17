set(resummino_SRCS
  hxs.cc
  hxs_dlnm2.cc
  hxs_dpt2.cc
  kinematics.cc
  main.cc
  maths.cc
  matrix_born.cc
  matrix_box.cc
  matrix_bubble.cc
  matrix_counterterm.cc
  matrix_real.cc
  matrix_triangle.cc
  params.cc
  pdf.cc
  pxs_gaugino_gluino.cc
  pxs_gaugino_gluino_virtual.cc
  pxs_gaugino_gluino_real.cc
  pxs_gaugino_squark_virtual.cc
  pxs_gaugino_squark_real.cc
  pxs_gaugino_squark.cc
  pxs_gauginos.cc
  pxs_gauginos_real.cc
  pxs_gauginos_virtual.cc
  pxs_leptons.cc
  pxs_leptons_real.cc
  pxs_leptons_virtual.cc
  pxs_sleptons.cc
  pxs_sleptons_real.cc
  pxs_sleptons_virtual.cc
  resummation.cc
  dipoles.cc
  matrix_elements_gaugl.cc
  matrix_elements_gaugl_real.cc
  matrix_elements_gausq.cc
  integration_method.cc
)


add_executable(resummino ${resummino_SRCS})
add_dependencies(resummino lt)

## changed the looptools configure script that the folder is always called lib
target_link_libraries(resummino ${GSL_LIBRARIES} ${LHAPDF_LIBRARIES}
	${LHAPDF_LIBRARIES} ${LOOPTOOLS_LIBRARIES} gfortran)

install(TARGETS resummino RUNTIME DESTINATION bin)
