
public class Std2
{
    fun static float db2lin(float db) { return Math.pow(10.,db/20.0); }
    
    fun static float clamp(float x, float min, float max)
    {
        if(x <= min) return min;
        if(x >= max) return max;
        return x;
    }
    
    fun static float map(float x, float xMin, float xMax, float yMin, float yMax)
    {
        (x-xMin)/(xMax-xMin) => float norm;
        return norm*(yMax-yMin) + yMin;
    }
}

