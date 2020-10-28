module fonctions2D
  
  ! module principal contenant les sous-routines de ce tp  
  implicit none
  
contains
  
  ! Initialisation u
  subroutine init(u,x,y,nx,xmin,xmax)
    implicit none
    
    real*8, intent(inout), dimension (:,:) :: u
    real*8, intent(inout), dimension (:) :: x,y
    integer , intent(in) :: nx
    real*8 :: xmin,xmax, mid
    integer  :: i,j
    
    mid = (xmax-xmin)/2.
    
    do i=1, nx
       do j=1,nx
          u(i,j) = 0.
          if (sqrt((x(i)-mid)**2+(y(j)-mid)**2).le.0.2) u(i,j)=1. 
          print*,i,j, u(i,j)
       enddo
      
    enddo

  end subroutine  Init
  
  
  ! Euler explicite + centré ordre 2 en espace 
  subroutine schema_num(u, u_next,dt,dx,nx,c_x,c_y)
    implicit none
    real*8, intent(in), dimension (:,:) :: u
    real*8, intent(inout), dimension (:,:) :: u_next
    real*8 , intent(in) :: dt,dx,c_x,c_y
    integer , intent(in) :: nx
    integer  :: i,j,ip,im,jp,jm
    real*8 :: a, b
 
 ! conditions aux limites périodiques

    do i=1, nx
       ip = i+1
       if (i.eq.nx) ip = 1
       im = i-1
       if (i.eq.1) im = nx
       
       do j=1, nx
          
          jp = j+1
          if (j.eq.nx) jp = 1
          jm = j-1
          if (j.eq.1) jm = nx
          
          u_next(i,j) = u(i,j) - c_x*dt*(u(ip,j)-u(im,j))/(2.*dx) - c_y*dt*(u(i,jp)-u(i,jm))/(2.*dx)
       enddo
    enddo
    
  end subroutine  schema_num
  
end module fonctions2D


!  Programme principal

program Transport_DF_2D
  
  use fonctions2D
  
  implicit none
  
  real*8,ALLOCATABLE:: u(:,:), u_next(:,:),x(:),y(:)
  real*8 :: dt, tmax, dx, xmax, xmin,cfl,c_x,c_y,time
  integer :: nb_iter,i, nfreq,k, nx,nbre,j
  character(len=50) :: mystr
  
  OPEN(10,file='C_IN.DAT',status='OLD')
  READ(10,*)
  read(10,*)nx
  READ(10,*)
  read(10,*)tmax
  READ(10,*)
  read(10,*)c_x
  READ(10,*)
  read(10,*)c_y
  READ(10,*)
  read(10,*)cfl
  READ(10,*)
  read(10,*)nfreq
  READ(10,*)
  close(10)
  
  xmin = 0.
  xmax = 1.
  
  dx = (xmax-xmin)/nx
  dt= cfl*dx
  nb_iter = ceiling(tmax/dt)
  time = 0.

  ! Initialisation
  allocate(u(1:nx,1:nx))
  allocate(u_next(1:nx,1:nx))
  allocate(x(1:nx))
  allocate(y(1:nx))
  
  do i=1,nx
     x(i) = i*dx
  enddo
  
  do j=1,nx
     y(j) = j*dx
  enddo
  
  call init(u,x,y,nx,xmin,xmax)
  
  ! boucle temporelle principale
  do k = 1, nb_iter
     print*, 'ite',k
     time = time +dt

     ! appel de la routine d'integration
     call schema_num(u, u_next,dt,dx,nx,c_x,c_y)
     u = u_next
     
     ! ecriture du resultat toutes les nfreq iterations
     
     if (mod(k,nfreq).eq.0) then
        
        nbre = k/nfreq
        write(mystr,'(i4.4)')nbre 
        open(222,file='u'//trim(mystr),position='append')
        
        open(222,file='sol'//trim(mystr)//'.vtk',position='append')
        write(222,'(1A26)') '# vtk DataFile Version 2.0'
        write(222,'(a)') 'solution'
        write(222,'(a)') 'ASCII'
        write(222,'(a)') 'DATASET STRUCTURED_POINTS'
        write(222,'(a10,x,I4,x,I4,x,I4)') 'DIMENSIONS', nx, nx,1
        write(222,'(a,E23.15,E23.15,E23.15)') 'ORIGIN', 0.,0.,0.
        write(222,'(a,E23.15,E23.15,E23.15)') 'SPACING', dx,dx, 1.
        write(222,'(a,x,I6)') 'POINT_DATA' , nx*nx
        write(222,'(a)') 'SCALARS u_velocity float 1'
        write(222,'(a)') 'LOOKUP_TABLE default'
        


        !Ecriture dans le fichier 
        do i=1,nx
           do j=1,nx
              write(222,*)  u(i,j)
           enddo
        enddo
        close(222)  
        
     endif
     
  end do
  
  deallocate(u,u_next,x)
  
end program Transport_DF_2D

