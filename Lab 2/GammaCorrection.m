function GImage = GammaCorrection( OImage, Gamma, Lower, Upper )
%GammaCorrection Implement gamma correction
%   Truncate the original gray values using lower and upper quantiles
%   (Lower, Upper) and then apply gamma correction with exponent Gamma to input
%   image OImage, the result is the double image GImage with maximum gray
%   value one
%
%% Who has done it
%
% Author: Oscar Nord, LiU-ID: oscno829
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
%
%% Syntax of the function
%
%   Input arguments:
%       OImage: RGB image of type uint8 or double
%       Gamma: exponent used in the gamma correction, 
%       'GImage = OImage^Gamma'
%       Lower: value in the range 0, 1
%       Upper: value in the range 0, 1 and lower < upper
%       Lower and Upper are quantile values. 
%   Output argument: GImage: gamma corrected gray value image of type double
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

%% Image size and result allocation
%

%Convert OImage to grayscale
if isa(OImage,'uint8')
        OImage = double(rgb2gray(OImage)); %convert to double
    else
        OImage = double(rgb2gray(OImage)); %if double do nothing
end

[sx,sy,nc] = size(OImage);

GImage = OImage;
%% Lower and upper gray value boundaries
%

lowgv = quantile(GImage(:),Lower);
uppgv = quantile(GImage(:),Upper);

%% Compute a scaled version GImage of the image where 
% the lower-bound gray value is zero 
% the upper-bound gray value is one 
% because 0^Gamma = 0 and 1^Gamma = 1
%

%Set max & min values to use in shift/move & scale
omin = double(1);
omax = double(1);

%Determine the shift/move pixel intensity values
shift_val = lowgv - omin;

%Determine the value to "scale" pixel intensity values by
scale_val = omax/(uppgv-lowgv);
%scale_val = omax/(lowgv-uppgv);

%Perform the shift and scale
GImage = (GImage(1:sx,1:sy,1:nc)-double(shift_val)).*double(scale_val);

%% Actual mapping of the previous result 
%
%Perform gamma correction
GImage = GImage.^Gamma; %mapping

%Display image
imshow(GImage)
end
