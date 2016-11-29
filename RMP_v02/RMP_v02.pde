
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Movie bgMovie; // movie class
Minim minim;  // a class for obtaining audio inputs, playing audio files 
AudioPlayer myAudio; //this will play & loop files
FFT myAudioFFT; //This class is used to analyse audio spectrum

//int myAudioRange = 256;
//myAudioMax = 100;



void setup()
{
  size(1920, 1080);
  minim = new Minim(this);
  myAudio = minim.loadFile("enya.mp3");
  myAudio.loop();
  
   fft = new FFT( myAudio.bufferSize(), myAudio.sampleRate() ); 
  // // perform a forward FFT on the samples in the tracks mix buffer,
  // contains the mix of both the left and right channels of the file
  
}

void draw()
{
  rect( 0, 0, myAudio.left.level()*width, 150 );
  rect( 0, 100, myAudio.right.level()*width, 150 );
  
  for(int i = 0; i < myAudio.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, myAudio.bufferSize(), 0, width );
      float x2 = map( i, 0, myAudio.bufferSize(), 0, width );
      line( x1, 50 + myAudio.left.get(i)*50, x2, 50 + myAudio.left.get(i+1)*150 );
      line( x1, 150 + myAudio.right.get(i)*50, x2, 150 + myAudio.right.get(i+1)*150 );
    }
  fft.forward( myAudio.mix );
  
 for(int i = 0; i < fft.specSize(); i++){
 }
 
}  