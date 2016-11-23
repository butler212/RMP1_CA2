
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;  // a class for obtaining audio inputs, playing audio files 
AudioPlayer myAudio; //this will play & loop files
FFT myAudioFFT; //This class is used to analyse audio spectrum

int myAudioRange = 256;
myAudioMax = 100;



void setup()
{
  size(700, 700);
}