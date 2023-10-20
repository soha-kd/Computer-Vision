d = input ('dimension d*d => ','s');
m_data=str2double(d);
t=floor(m_data(1)*0.5);
z=floor(m_data(1)*0.5);
dist_a=zeros(m_data);
dist_c=zeros(m_data);
dist_8=zeros(m_data);
for i=0:m_data-1
    for j=0:m_data-1
     dist_a(i+1,j+1)=sqrt((t-i)^2 + (z-j)^2);
     dist_c(i+1,j+1)=(abs(t-i) + abs(z-j));
     dist_8(i+1,j+1)=max(abs(t-i) , abs(z-j));
    end
end
disp(['dimension : ',num2str(m_data),'*',num2str(m_data)])
disp('dist_a = ')
disp(num2str(dist_a))
disp('    ')
disp('------------')
disp('dist_c = ')
disp('    ')
disp(num2str(dist_c))
disp('------------')
disp('dist_8 = ')
disp('    ')
disp(num2str(dist_8))
    
     