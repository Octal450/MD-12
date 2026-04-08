# McDonnell Douglas MD-12 Simplified Engines
# Copyright (c) 2026 Josh Davidson (Octal450)

var ENGINES = {
	reverseEngage: props.globals.getNode("/systems/fadec/reverse-engage"),
	Controls: {
		throttle: [props.globals.getNode("/controls/engines/engine[0]/throttle"), props.globals.getNode("/controls/engines/engine[1]/throttle"), props.globals.getNode("/controls/engines/engine[2]/throttle"), props.globals.getNode("/controls/engines/engine[3]/throttle")],
		throttleTemp: [0, 0, 0, 0],
	},
};

var FADEC = {
	Limit: {
		activeNorm: props.globals.getNode("/systems/fadec/limit/active-norm"),
	},
};

var toggleRevThrust = func() {
	if ((pts.Gear.wow[1].getBoolValue() or pts.Gear.wow[2].getBoolValue()) and ENGINES.Controls.throttle[0].getValue() <= 0.05 and ENGINES.Controls.throttle[1].getValue() <= 0.05 and ENGINES.Controls.throttle[2].getValue() <= 0.05 and ENGINES.Controls.throttle[3].getValue() <= 0.05) {
		if (ENGINES.reverseEngage.getBoolValue()) {
			ENGINES.Controls.throttle[0].setValue(0);
			ENGINES.Controls.throttle[1].setValue(0);
			ENGINES.Controls.throttle[2].setValue(0);
			ENGINES.Controls.throttle[3].setValue(0);
			ENGINES.reverseEngage.setBoolValue(0);
		} else {
			ENGINES.reverseEngage.setBoolValue(1);
		}
	} else {
		ENGINES.Controls.throttle[0].setValue(0);
		ENGINES.Controls.throttle[1].setValue(0);
		ENGINES.Controls.throttle[2].setValue(0);
		ENGINES.Controls.throttle[3].setValue(0);
		ENGINES.reverseEngage.setBoolValue(0);
	}
}

var doIdleThrust = func() {
	ENGINES.Controls.throttle[0].setValue(0);
	ENGINES.Controls.throttle[1].setValue(0);
	ENGINES.Controls.throttle[2].setValue(0);
	ENGINES.Controls.throttle[3].setValue(0);
}

var doLimitThrust = func() {
	var active = FADEC.Limit.activeNorm.getValue();
	ENGINES.Controls.throttle[0].setValue(active);
	ENGINES.Controls.throttle[1].setValue(active);
	ENGINES.Controls.throttle[2].setValue(active);
	ENGINES.Controls.throttle[3].setValue(active);
}

var doFullThrust = func() {
	ENGINES.Controls.throttle[0].setValue(1);
	ENGINES.Controls.throttle[1].setValue(1);
	ENGINES.Controls.throttle[2].setValue(1);
	ENGINES.Controls.throttle[3].setValue(1);
}
