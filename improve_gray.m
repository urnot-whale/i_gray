clc;clear;close all;
% %��rgbͼ���
% file_path =  'D:\lz\underwater robot\opencv\paper\lz\Ͷ��\JEI\p\';% ͼ���ļ���·��  
% img_path_list = dir(strcat(file_path,'underwater color checker 25.png'));
% %dir �г���ǰ�ļ����е��ļ���Ϣ
% img_num = length(img_path_list)%��ȡͼ��������
% fprintf('���ڶ�ȡ��ͼ��Ϊ��\n');
% if img_num > 0 %������������ͼ��
%     for j = 1:img_num %��һ��ȡͼ��
%         img_name = [file_path,'',int2str(j),'.png'];
%         img=imread(img_name);%4ɫͨ����
%         R = img(:,:,1);G = img(:,:,2);B = img(:,:,3);  
%         Rave = mean2(R);Gave = mean2(G); Bave = mean2(B);
%         K = (Rave + Gave + Bave) / 3;
%         pb = zeros(256,1);
%         pg = zeros(256,1);
%         pr = zeros(256,1); 
%         for i = 1:255*255
%             pb(img(3*i-2)+1) = pb(img(3*i-2)+1)+1;
%             pg(img(3*i-1)+1) = pg(img(3*i-1)+1)+1;
%             pr(img(3*i)+1) = pr(img(3*i)+1)+1;
%         end
%         pb = pb/(255*255);pg = pg/(255*255);pr = pr/(255*255); 
%         hr = 0;hg = 0;hb = 0;
%         for i = 1:256
%             if(pr(i)>0)
%                  hr = hr - pr(i)*log2(pr(i));
%             end
%             if(pg(i)>0)
%                 hg = hg - pg(i)*log2(pg(i));
%             end
%             if(pb(i)>0)
%                 hb = hb - pb(i)*log2(pb(i));
%             end
%         end
% %         fprintf('��%02d����%s\n',j,img_name);
%     end
%     R_new=(K/Rave)*R;G_new=(K/Gave)*G;B_new=(K/Bave)*B;
%     R_new1=R_new*(2-hr/(1+hr));
%     G_new1=G_new*(2-hg/(1+hg));
%     B_new1=B_new*(2-hb/(1+hb));
%     currentPath=pwd; % ���浱ǰ?��?¼
%     cd('D:\lz\underwater robot\opencv\paper\lz\Ͷ��\JEI\p') % �ѵ�ǰ?��?¼�л���ָ��?����
% %imwrite(cat(3,R_new,G_new,B_new),'28.png')
%     imwrite(cat(3,R_new1,G_new1,B_new1),'underwater color checker 25_imgray.png')
% %imwrite(cat(3,R_new2,G_new2,B_new2),'11.png')
%     cd(currentPath) % �л�ԭ?��?¼80
% end


img=imread('D:\lz\underwater robot\opencv\paper\lz\Ͷ��\JEI\p\underwater color checker 25.png'); 
%subplot(8000),imshow(img),title('ԭͼ');test1_dehaze.png
R = img(:,:,1);G = img(:,:,2);B = img(:,:,3);  
Rave = mean2(R);Gave = mean2(G); Bave = mean2(B);
K = (Rave + Gave + Bave) / 3;
pb = zeros(256,1);
pg = zeros(256,1);
pr = zeros(256,1); 
for i = 1:255*255
    pb(img(3*i-2)+1) = pb(img(3*i-2)+1)+1;
    pg(img(3*i-1)+1) = pg(img(3*i-1)+1)+1;
    pr(img(3*i)+1) = pr(img(3*i)+1)+1;
end
pb = pb/(255*255);pg = pg/(255*255);pr = pr/(255*255); 
hr = 0;hg = 0;hb = 0;
for i = 1:256
    if(pr(i)>0)
        hr = hr - pr(i)*log2(pr(i));
    end
    if(pg(i)>0)
        hg = hg - pg(i)*log2(pg(i));
    end
    if(pb(i)>0)
        hb = hb - pb(i)*log2(pb(i));
    end
end
%fprintf('R��������Ϊ:%f\n',hr)
%fprintf('G��������Ϊ:%f\n',hg)
%fprintf('B��������Ϊ:%f\n',hb)

R_new=(K/Rave)*R;G_new=(K/Gave)*G;B_new=(K/Bave)*B;
%R_new=K/Rave;G_new=K/Gave;B_new=K/Bave;
%subplot(8000),imshow(cat(4,R_new,G_new,B_new)),title('ƽ���');

R_new1=R_new*(2.2-hr/(1+hr));
G_new1=G_new*(2.2-hg/(1+hg));
B_new1=B_new*(2.2-hb/(1+hb));
%R_new2=R_new1*R;G_new2=G_new1*G;B_new2=B_new1*B;

currentPath=pwd; % ���浱ǰ?��?¼
cd('D:\lz\underwater robot\opencv\paper\lz\Ͷ��\JEI\p\') % �ѵ�ǰ?��?¼�л���ָ��?����
%imwrite(cat(3,R_new,G_new,B_new),'28.png')
imwrite(cat(3,R_new1,G_new1,B_new1),'underwater color checker25_im.png')
%imwrite(cat(3,R_new2,G_new2,B_new2),'11.png')
cd(currentPath) % �л�ԭ?��?¼80