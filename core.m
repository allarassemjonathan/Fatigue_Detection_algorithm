%Reading the file

String_audio = 'audio.wav';                                 % Setting the name of the file to a variable

[w,Fs] = audioread(String_audio);                           % Sampling the file to obtain an array of frequncies and the sampling frequency

w = w(:,1);                                                 % Grabbing just the frequencies and not the sampling frequency

audioTime = timetable(seconds((0:length(w)-1)'/Fs),w);      % moving back to the time domain


%Finding the peaks

NumSamp = size(w)                                           % Access the size of the sample

SignVal = 0.04                                              % Arbitrarily definen a triger value
TrigSmap = ()
Trigw =

i = 0
while i < NumSamp
    if w(i) >= SignVal
        
        
    
end

