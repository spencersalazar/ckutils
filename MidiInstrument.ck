
public class MidiInstrument
{
    MidiIn min;
    
    // general API
    fun int open(int i)
    {
        if(!min.open(i))
            return -1;
        
        spork ~ _go();
        
        return 0;
    }
    
    fun void close()
    {
        
    }
    
    // override these in subclasses
    fun void noteOn(int channel, int note, float velocity)
    {
        chout <= "noteOn: " <= note <= ", velocity: " <= velocity <= ", channel: " <= channel <= IO.nl();
    }
    
    fun void noteOff(int channel, int note, float velocity)
    {
        chout <= "noteOff: " <= note <= ", channel: " <= channel <= IO.nl();
    }
    
    fun void controlChange(int channel, int control, float value)
    {
        chout <= "controlChange: " <= control <= ", value: " <= value <= ", channel: " <= channel <= IO.nl();
    }
    
    fun void pitchBend(int channel, float value)
    {
        chout <= "pitchBend: " <= value <= ", channel: " <= channel <= IO.nl();
    }
    
    // internal operation -- don't mess
    fun void _go()
    {
        MidiMsg msg;
        
        while(true)
        {
            min => now;
            while(min.recv(msg))
            {
                // noteOn
                if((msg.data1 & 0xF0) == 0x90)
                {
                    if(msg.data3 > 0) // check for 0-velocity (=> noteOff)
                        noteOn(msg.data1 & 0x0F, msg.data2, msg.data3/127.0);
                    else
                        noteOff(msg.data1 & 0x0F, msg.data2, msg.data3/127.0);
                }
                else if((msg.data1 & 0xF0) == 0xB0)
                {
                    controlChange(msg.data1 & 0x0F, msg.data2, msg.data3/127.0);
                }
                else if((msg.data1 & 0xF0) == 0xE0)
                {
                    pitchBend(msg.data1 & 0x0F, (((msg.data3 << 7) + msg.data2)-8192.0)/8192.0);
                }
                else
                {
                    <<< msg.data1 >> 4, msg.data1 & 0x0F, msg.data2, msg.data3 >>>;
                }
            }
        }
    }
}

