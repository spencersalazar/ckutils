
public class ChannelTest
{
    fun static void test()
    {
        CNoise n;
        0.5 => n.gain;
        "pink" => n.mode;
        
        for(int i; i < dac.channels(); i++)
        {
            n => dac.chan(i);
            1::second => now;
            n =< dac.chan(i);
        }
    }
}
