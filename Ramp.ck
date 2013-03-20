
public class Ramp
{
    fun static float linear(float t, float start, float finish)
    {
        return start+t*(finish-start);
    }
    
    fun static float exp(float t, float start, float finish)
    {
        return start*Math.exp(t*Math.log(finish/start));
    }
}
