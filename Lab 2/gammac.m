function output_image = gammac(input_image,gamma_value)
%   gammac          -   Normalizes image intensity values over [0,1] and
 
%                       performs gamma correction on it
 
%   output_image    -   The finished image
 
%   input_image     -   The source image data
 
%   gamma_value     -   The gamma value to use
 
% (C) 2010 Matthew Giassa, <teo@giassa.net> www.giassa.net
 
%==========================================================================
 
%Make a grayscale copy of our input image
 
I = double(rgb2gray(input_image));
%Determine input image dimensions
 
[j k] = size(I);
%Determine the extreme intensity values for our input image
 
%in_min = double(min(min(I)));
%in_max = double(max(max(I)));
in_min = quantile(I(:),Lower);
in_max = quantile(I(:),Upper);
%Determine the extreme intensity values for the output image
 
out_min = double(1);
out_max = double(1);
%Determine the amount to "shift/move" pixel intensity values by
 
shift_val = in_min - out_min;
%Determine the value to "scale" pixel intensity values by
 
scale_val = (out_max)/(in_max-in_min);
%Perform the shift and scale (in that order)
 
% for counter1 = 1:j
%  for counter2 = 1:k
%  I(counter1,counter2)=(I(counter1,counter2)-double(shift_val))*double(scale_val);
%  end
% end
I = (I(:,:,:)-double(shift_val)).*double(scale_val);
%Perform the gamma correction operation
 
% for counter1 = 1:j
%  for counter2 = 1:k
%  I(counter1,counter2)=(I(counter1,counter2)).^gamma_value;
%  end
% end
    I = I.^gamma_value;
 output_image = I;