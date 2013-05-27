
public class Lerp
{
    0 => float _value;
    0 => float _target;
    0.01 => float _slew;
    
    fun float lerp()
    {
        _value + (_target-_value)*_slew => _value;
        return _value;
    }
    
    fun float target(float t)
    {
        t => _target;
        return _target;
    }
    
    fun float slew(float s)
    {
        s => _slew;
        return _slew;
    }
}
