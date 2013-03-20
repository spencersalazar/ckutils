public class GameTrak
{
    fun void process(int hand, int axis, float position)
    {
        // axis can be one of 0: x, 1: y, 2: z
    }
    
    fun void start(int index)
    {
        spork ~ go(index);
    }
    
    fun void go(int index)
    {
        Hid gt;
        HidMsg msg;
        
        gt.openJoystick(index);
        
        while(true)
        {
            gt => now;
            while(gt.recv(msg))
            {
                msg.which%3 => int axis; // 0: x, 1: y, 2: z
                Math.floor(msg.which/3.0)$int => int hand;
                
                process(hand, axis, msg.axisPosition);
            }
        }
    }
}
