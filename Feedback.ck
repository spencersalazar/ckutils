
public class Feedback extends Chubgraph
{
    inlet => Gain signal => Gain direct => outlet;
    signal => Delay feedback => signal;
    
    1::second => feedback.max;
    250::ms => feedback.delay;
    0.5 => feedback.gain;
    1 => direct.gain;
}
