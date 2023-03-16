!******************************************************************************!
! Copyright (C) 2014-2019 OpenLoops Collaboration. For authors see authors.txt !
!                                                                              !
! This file is part of OpenLoops.                                              !
!                                                                              !
! OpenLoops is free software: you can redistribute it and/or modify            !
! it under the terms of the GNU General Public License as published by         !
! the Free Software Foundation, either version 3 of the License, or            !
! (at your option) any later version.                                          !
!                                                                              !
! OpenLoops is distributed in the hope that it will be useful,                 !
! but WITHOUT ANY WARRANTY; without even the implied warranty of               !
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                !
! GNU General Public License for more details.                                 !
!                                                                              !
! You should have received a copy of the GNU General Public License            !
! along with OpenLoops.  If not, see <http://www.gnu.org/licenses/>.           !
!******************************************************************************!


module kind_types
  implicit none

  integer, parameter :: intkind1 = selected_int_kind(2)
  integer, parameter :: intkind2 = selected_int_kind(6)
#ifdef USE_sp
  integer, parameter :: sp = selected_real_kind(6)
  complex(sp), parameter :: cI_sp = (0._sp, 1._sp)
#endif
  integer, parameter :: dp = selected_real_kind(15)
  complex(dp), parameter :: cI_dp = (0._dp, 1._dp)
#ifdef USE_ep
  integer, parameter :: ep = selected_real_kind(18)
  complex(ep), parameter :: cI_ep = (0._ep, 1._ep)
#endif
  integer, parameter :: qp = selected_real_kind(33)
  complex(qp), parameter :: cI_qp = (0._qp, 1._qp)

  interface cmplx_wp
#ifdef USE_sp
    module procedure cmplx_sp
#endif
    module procedure cmplx_dp
#ifdef USE_ep
    module procedure cmplx_ep
#endif
    module procedure cmplx_qp
  end interface cmplx_wp
  contains
#ifdef USE_sp
  function cmplx_sp(re, im)
    implicit none
    real(sp), intent(in) :: re
    real(sp), intent(in), optional :: im
    complex(sp) :: cmplx_sp
    cmplx_sp = re
    if (present(im)) cmplx_sp = cmplx(re,im,sp)
  end function cmplx_sp
#endif
  function cmplx_dp(re, im)
    implicit none
    real(dp), intent(in) :: re
    real(dp), intent(in), optional :: im
    complex(dp) :: cmplx_dp
    cmplx_dp = re
    if (present(im)) cmplx_dp = cmplx(re,im,dp)
  end function cmplx_dp
#ifdef USE_ep
  function cmplx_ep(re, im)
    implicit none
    real(ep), intent(in) :: re
    real(ep), intent(in), optional :: im
    complex(ep) :: cmplx_ep
    cmplx_ep = re
    if (present(im)) cmplx_ep = cmplx_ep + im * cI_ep
  end function cmplx_ep
#endif
  function cmplx_qp(re, im)
    implicit none
    real(qp), intent(in) :: re
    real(qp), intent(in), optional :: im
    complex(qp) :: cmplx_qp
    cmplx_qp = re
    if (present(im)) cmplx_qp = cmplx_qp + im * cI_qp
  end function cmplx_qp
end module kind_types

module kind_types_bw
  use kind_types, only: intkind1
  implicit none

  integer, parameter :: B00 = int(B"00", kind=intkind1)
  integer, parameter :: B11 = int(B"11", kind=intkind1)
  integer, parameter :: B01 = int(B"01", kind=intkind1)
  integer, parameter :: B10 = int(B"10", kind=intkind1)
  integer, parameter :: B1111 = int(B"1111", kind=intkind1)
  integer, parameter :: B1001 = int(B"1001", kind=intkind1)
  integer, parameter :: B1010 = int(B"1010", kind=intkind1)
  integer, parameter :: B1110 = int(B"1110", kind=intkind1)
  integer, parameter :: B1011 = int(B"1011", kind=intkind1)
  integer, parameter :: B0110 = int(B"0110", kind=intkind1)
  integer, parameter :: B0111 = int(B"0111", kind=intkind1)
  integer, parameter :: B1101 = int(B"1101", kind=intkind1)
  integer, parameter :: B0101 = int(B"0101", kind=intkind1)

end module kind_types_bw
