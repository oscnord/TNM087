function CImage = WhitePoint(OImage,type)
%WhitePoint Type conversion and white point correction
%   Convert OImage to an image with specified white point
%
%% Who has done it
%
% Author: Oscar Nord LiU-ID: oscno829 
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
%
%% Syntax of the function
%
% Input arguments:  OImage original image of type uint8, uint16 or double
%                   type: character variable describing type of CImage,
%                       values are 'b' (uint8), 's' (uint16), 'd' (double) 
% Output arguments: CImage color corrected image
%
%   The MINIMUM solution must be able to handle an uint16 OImage and an uint8 CImage 
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: 20/11/2015
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

%% The default output type is uint8 
% More information about handling of function arguments, string
% manipulation and basic data types can be found in WhitePoint.pdf
%

if (nargin < 2)
    otype = 'b';
else
    if strcmp(type,'b')
        otype = 'b';
    else
        otype = 'd';
    end
end;

% The type of the output image is either uint8 (type 'b') or double (type 'd') 
    
%% Find out the type of the input image 
% You can assume that it is either uint8 or double
%
    if isa(OImage,'uint8')
        InputImage = double(OImage);% convert to double
    else
        InputImage = OImage;
    end

%% Display the input image and pick the white point
fh = figure;
imshow(OImage) %display the input image 

whitept = ginput(1); % select the point that should be white
whitept = round(whitept);

%Set rgbvec
rgbvec = InputImage(double(whitept(:,1)),double(whitept(:,2)),:);
rgbvec = squeeze(rgbvec)'; % This is the RGB vector at the point you selected

%% Generate the result image CImage
switch otype
    case 'b' %uint8
        CImage = uint8(OImage); 
    case 'd' %double
        CImage = double(OImage);
    otherwise 
%         if you do the extended version add your code here
end 

%% Scaling of CImage such that the pixel at whitept is
% (maxpix,maxpix,maxpix) 
% where maxpix is the maximum value in a channel which depends on the 
% type of the resulting CImage (see otype)
%
% Also truncate pixel values greater than maxpix to maxpix
% 

% Here you need several lines of code where rgbvec defines the scaling
% after the scaling you have to truncate the pixel values
% Finally you have to convert the result to the datatype given by otype

%Get mean of point and original image
meanrgb = round(mean([rgbvec(1), rgbvec(2), rgbvec(3)]));
meanR = mean2(InputImage(:,:,1));
meanG = mean2(InputImage(:,:,2));
meanB = mean2(InputImage(:,:,3));

%Scale image.
cFactorR = meanrgb/meanR;
cFactorG = meanrgb/meanG;
cFactorB = meanrgb/meanB;

%Get channels 
rch = InputImage(:,:,1);
gch = InputImage(:,:,2);
bch = InputImage(:,:,3);

%Do the white point correction
rch = uint8(single(rch) * cFactorR);
gch = uint8(single(gch) * cFactorG);
bch = uint8(single(bch) * cFactorB);

% Recombine into an RGB image
CImage = cat(3, rch, gch, bch);

%% Cleaning
close(fh)
end
