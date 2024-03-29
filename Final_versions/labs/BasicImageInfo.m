function [ ImSize, ImType, BitPerPixel, MaxMin, RGBpts, figh ] = ...
    BasicImageInfo( filename, nopts)
%BasicImageInfo: Collect basic information about an image
%   Use imfinfo to extract the size of the image and the image type
%   Use ginput to pick a number of positions in a figure
%   Mark these points with white squares
%
%% Who has done it
%
% Author: Oscar Nord LiU-ID: oscno829
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
%

%% Syntax of the function
%
% Input arguments:  filename: pathname to the image file
%                   nopts: Number of pixel positions to pick with ginput
% Output arguments: ImSize: size of the image
%                       in a two-element vector of the form: [Width, Height]
%                   ImType: string usually either jpg or tif
%                   BitPerPixel: Number of bits per pixel (8 or 16)
%                   MinMax: Maximum and minimum values of the elements
%                       in the image matrix in a two-element vector: [minvalue, maxvalue]
%                   RGBpts: First use ginput to select the coordinates
%                       of nopts points in the image,
%                       then select the RGB vectors at these positions in
%                       RGBpts which is a matrix of size (nopts,3)
%                   figh: this is a handle to a figure in which you marked
%                       the selected positions with white squares
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 3
% Date: 17/12/2015
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
%

%% Internal variable describing the size of the marked square

Qsize = 10;
%% Your code starts here
%
%Load file
impath = filename;

%% Collect image information with imfinfo 
%   (ONE line of code for each output variable)
%Get info of imagefile
info = imfinfo(impath);

ImSize = [info.Width, info.Height]  
ImType = info.Format
BitPerPixel = info.BitDepth
ColorType = info.ColorType % Use 'ColorType' to find out if it is a color or a grayvalue image

%% Compute minimum and maximum values
%   (ONE line of code)
OImage = imread(impath); 
%Get max and min in form of [max,min]
MaxMin = [double(max(OImage(:))),double(min(OImage(:)))]

%% Pick the pixel positions and collect the RGBvectors
% Decide what you do if it is a grayvalue image
%
nopts = 3;
%Check if it's a grayscale or color image
%Number of dimensions in the image if > 2 in a RGB image
if ndims(OImage) > 2
    disp('Image is of type: Color')
else
    %If not set it to "rgb"-image
    OImage = cat(3,OImage,OImage,OImage);
    disp('Image is of type: Grayscale')
end

%Show image and take input from user
fh1 = imshow(OImage);
PtPos = ginput(nopts);

% round to nearest int
PtPos(:,:) = round(PtPos(:,:));

for k = 1:nopts
    RGBpts(k,:,:) = impixel(OImage, PtPos(k,1), PtPos(k,2));
    %%% Didn't work for me so used the old one.
    %RGBpts(k,:,:) = OImage(PtPos(k,2), PtPos(k,2));
end

%% Generate the white squares and display the result
%
figh = figure;
DImage = OImage;   

%Check if double, uint8 or uint16 and set maximum value
type = class(OImage);

if strcmpi(type, 'double') == 1
    max = 1;
elseif strcmpi(type, 'uint8') == 1
    max = 255;
elseif strcmpi(type, 'uint16') == 1
    max = 65535;
else
    disp('load image of type double, uint8 or uint16.')
end

%Show image and generate squares on top
for k = 1:nopts
    %Generate the white squares from PtPos with size of Qsize
    for n = 1:Qsize
        DImage((PtPos(k,2)- (Qsize/2)):(PtPos(k,2)+ (Qsize/2)),(PtPos(k,1) ... 
                - (Qsize/2)):(PtPos(k,1)+ (Qsize/2)),:) = max;
    end
end 
imshow(DImage)
    
    
    
    
    
    

