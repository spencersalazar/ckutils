public class Poly extends Chubgraph
{
    UGen @ voices[4];
    0 => int lastVoice;
    
    setNumVoices(4);
    
    fun void setNumVoices(int num)
    {
        for(int i; i < voices.cap(); i++)
        {
            if(voices[i] != null)
            {
                voices[i] =< outlet;
            }
        }
        
        UGen @ newVoices[num] @=> voices;
        
        for(int i; i < voices.cap(); i++)
        {
            create() @=> voices[i];
            voices[i] => outlet;
        }
    }
    
    fun UGen create()
    {
        return new UGen;
    }
    
    fun UGen get()
    {
        voices[lastVoice] @=> UGen @ g;
        
        (lastVoice + 1) % voices.cap() => lastVoice;
        
        return g;
    }
}
