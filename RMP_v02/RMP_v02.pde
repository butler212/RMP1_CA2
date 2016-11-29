
//importing minim libraries & video library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.video.*;

Movie bgMovie; // movie class
Minim minim;  // a class for obtaining audio inputs, playing audio files 
AudioPlayer myAudio; //this will play & loop files
FFT myAudioFFT; //This class is used to analyse audio spectrum


void setup()
{
  size(1920, 1080);
  minim = new Minim(this);
  myAudio = minim.loadFile("enya.mp3");
  myAudio.loop();
  bgMovie = new Movie(this, "video1.mp4");
  bgMovie.loop();
  
   myAudioFFT = new FFT( myAudio.bufferSize(), myAudio.sampleRate() ); 
  // perform a forward FFT on the samples in the tracks mix buffer,
  // contains the mix of both the left and right channels of the file
  
}

void draw()
{
  rect( 0, 0, myAudio.left.level()*width, 150); //drawing the 2 waveforms
  rect( 0, 100, myAudio.right.level()*width, 150); //they will display the current buffer if the audio
  
  image(bgMovie, 0, 0);
  
  for(int i = 0; i < myAudio.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, myAudio.bufferSize(), 0, width );
      float x2 = map( i, 0, myAudio.bufferSize(), 0, width );
      line( x1, 50 + myAudio.left.get(i)*50, x2, 50 + myAudio.left.get(i+1)*150 );
      line( x1, 150 + myAudio.right.get(i)*50, x2, 150 + myAudio.right.get(i+1)*150 );
    }
 
  myAudioFFT.forward(myAudio.mix); //analyser band
  
 for(int i = 0; i < myAudioFFT.specSize(); i++)
 {
 
  // draw the line for frequency band i, scaling it upwards
    line( i, height, i, height - myAudioFFT.getBand(i)*150 );
  }  
   
   // drawing a line to show where the song playback is currently at
  float posx = map(myAudio.position(), 0, myAudio.length(), 0, width);
  stroke(207,218,220);
  line(posx, 0, posx, height);
}  


void movieEvent(Movie m) {
  m.read();
  }