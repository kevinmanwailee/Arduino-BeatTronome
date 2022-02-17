s.boot;

(
SynthDef("help-synth", {| freq= #[100], out = 0|
	Out.ar(out, Mix(SinOsc.ar(freq, 0, 0.1)));
}).add;
)


~x.free;

SerialPort.devices;

(
~port = SerialPort("COM5")
)
~port.close;


(
~val = 0;
~val2 = 0;
~val3 = 0;
~val4 = 0;
~charArry = [];
~getValues = Routine.new({
	var ascii;
	{
		// read the ascii character from the serial port
		// first photo resister contains "a" suffix, 2nd = "b", etc.
		// Total 4 photo resisters
		ascii = ~port.read.asAscii;
		if(ascii.isDecDigit, {
			~charArray = ~charArray.add(ascii);
		});
		if(ascii == $a, {
			// convert the array to a numerical value
			~val = ~charArray.collect(_.digit).convertDigits;
			// empty array
			~charArray = [ ];
		});
		if(ascii == $b, {
			// convert the array to a numerical value
			~val2 = ~charArray.collect(_.digit).convertDigits;
			// empty array
			~charArray = [ ];
		});
		if(ascii == $c, {
			// convert the array to a numerical value
			~val3 = ~charArray.collect(_.digit).convertDigits;
			// empty array
			~charArray = [ ];
		});
		if(ascii == $d, {
			// convert the array to a numerical value
			~val4 = ~charArray.collect(_.digit).convertDigits;
			// empty array
			~charArray = [ ];
		});
	}.loop;
}).play;
)


~val;
~val2;
~val3;
~val4;

~getValues.stop;
~getValues.play;

~x = Synth("help-synth", [\freq:100]);
~x = Synth("help-synth", [\freq:500]);

(
~control=Routine.new({
	{
		// first note
		if(~val < 300, {
			~x.set(\freq, 500);
		});
		if(~val > 300, {
			~x.set(\freq, 100);
		});
		0.25.wait;
		~x.set(\freq, 100);
		0.25.wait;

		// second note
		if(~val2 < 300, {
			~x.set(\freq, 500);
		});
		if(~val2 > 300, {
			~x.set(\freq, 100);
		});
		0.25.wait;
		~x.set(\freq, 100);
		0.25.wait;

		// third note
		if(~val3 < 300, {
			~x.set(\freq, 500);
		});
		if(~val3 > 300, {
			~x.set(\freq, 100);
		});
		0.25.wait;
		~x.set(\freq, 100);
		0.25.wait;

		// fourth note
		if(~val4 < 300, {
			~x.set(\freq, 500);
		});
		if(~val4 > 300, {
			~x.set(\freq, 100);
		});
		0.25.wait;
		~x.set(\freq, 100);
		0.25.wait;


	}.loop;
}).play;
)


SerialPort.closeAll;