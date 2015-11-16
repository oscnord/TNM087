function figh = SimpleReplace(filename, rows, cols, box )
%SimpleReplace Change pixel values in simple image regions
%   Change pixel values in selected rows, columns and a box
%
%% Who has done it
%
% Author: Same LiU-ID/name as in the Lisam submission
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
%Oscar Nord oscno829

%% Syntax of the function
%
% Input arguments:  filename: pathname to the image file
%                   rows: vector of row indices
%                   cols: vector of column indices
%                   box: vector with four elements [sr,sc,size1,size2]
%                       where (sr,sc) are coordinates of box origin
%                       (size1, size2) is the size of the box 
%                       origin and size use row/column convention
%
% Output argument:  figh: handle to the figure displaying the new image 
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: today
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%       All non-zip archives will be rejected automatically
%
% 5) Often you must do something else between the given commands in the
%       template
%
%

%% Your code starts here
%

%% create figure and read image
%
figh = figure;
%Oimage = imread('H:\TNM087\Lab 1\Images\bild.jpg');
Oimage = imread('/Users/Oscar/Documents/TNM087/Lab 1/Images/bild.jpg');

%% Copy image and edit
%
% Specify rows and cols for test example
rows = [50:80]; 
cols = [50:80];

%figure(1)
Nimage = Oimage;
%imshow(Oimage);

% change rows
%Set specified rows to 255 (max)
%Nimage(rows:rows:end,:,1) = 255; 
Nimage(rows,:,1) = 255; 

% change cols
%Nimage(:,cols:cols:end,2) = 255;
Nimage(:,cols,2) = 255;  

inds = find(ismember(rows, cols));
Wimage1 = intersect(rows,cols);
%[C, ia, ib] = intersect(rows,cols);
Nimage(Wimage1,Wimage1,:) = 255;




% change box
%Nimage = Oimage;

%   box: vector with four elements [sr,sc,size1,size2]
%                       where (sr,sc) are coordinates of box origin
%                       (size1, size2) is the size of the box 
%                       origin and size use row/column convention

%box = [sr,sc,size1,size2]

% sr = 100;
% sc = 100;
% size1 = 80:100;
% size2 = 80:120;
% 
% box = [sr, sc, size1, size2];
% 
% test = box(:,1);
% 
% Nimage(test,test:end,:) = 255;

figure(3)
imshow(Nimage);  

% change grid points

Nimage =

%% Display result
%
imshow(Nimage);

end














%

%rows = 20;
%cols = 20;

%figure(1)
%Nimage = Oimage;
%imshow(Oimage);

% change rows
% Set Nimage to Oimage's red channel
%Nimage = Nimage(1:end,:,1);

%Test from stack
%Nimage(rows:rows:end,:,1) = 255; 
    %figure(2)
    %imshow(Nimage);

% Set Rows red pixel value to 255 (max)
%Nimage(1:end,:) = 255;
    %figure(3)
    %imshow(Nimage);

% Insert the red chanel in a copy of Oimage

%Fimage(:,:,3) = Oimage(:,:,3);
%Fimage(:,:,2) = Oimage(:,:,2);
%Fimage(:,:,1) = Nimage;

    %figure(4)
    %imshow(Fimage)

% change cols

%Nimage = Oimage(:,1:end,2);
%Nimage(:,1:end) = 255;

%Fimage(:,:,2) = Nimage;

    %figure(5)
    %imshow(Fimage)

%Nimage(:,cols:cols:end,2) = 255;
    
%figure(3)
%imshow(Nimage);    
    
    
% change box
%Nimage =

% change grid points



%indices = sub2ind(size(Nimage), rows,cols);
%Nimage(indices) = 255;