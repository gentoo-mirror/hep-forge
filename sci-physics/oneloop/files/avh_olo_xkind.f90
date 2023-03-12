!
!  Copyright (C) 2011 Andreas van Hameren. 
!
!  This file is part of OneLOop-2.2.1.
! 
!  OneLOop-2.2.1 is free software: you can redistribute it and/or modify
!  it under the terms of the GNU General Public License as published by
!  the Free Software Foundation, either version 3 of the License, or
!  (at your option) any later version.
!
!  OneLOop-2.2.1 is distributed in the hope that it will be useful,
!  but WITHOUT ANY WARRANTY; without even the implied warranty of
!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!  GNU General Public License for more details.
!
!  You should have received a copy of the GNU General Public License
!  along with OneLOop-2.2.1.  If not, see <http://www.gnu.org/licenses/>.
!


module avh_olo_xkind
! use !XKIND_MODULE
!
  implicit none
  private
  public :: olo_xkind
  !
  integer ,parameter :: olo_xkind=kind(1.0d0)
  !
end module
