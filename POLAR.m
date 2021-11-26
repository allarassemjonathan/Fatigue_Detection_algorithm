function [magnitude, arg] = converter(z)
    magnitude = abs(z);
    arg = rad2deg(angle(z))
end

