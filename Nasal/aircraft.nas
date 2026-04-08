# McDonnell Douglas MD-12 Aircraft Core
# Copyright (c) 2026 Josh Davidson (Octal450)

print("-------------------------------------------");
print("Copyright (c) 2026 Josh Davidson (Octal450)");
print("-------------------------------------------");

setprop("/sim/menubar/default/menu[5]/item[8]/enabled", 0);
setprop("/sim/menubar/default/menu[5]/item[9]/enabled", 0);
setprop("/sim/menubar/default/menu[5]/item[10]/enabled", 0);
setprop("/sim/menubar/default/menu[5]/item[11]/enabled", 0);
setprop("/sim/menubar/default/menu[5]/item[12]/enabled", 0);
setprop("/sim/multiplay/visibility-range-nm", 130);

var initDone = 0;
var fdmInit = setlistener("/sim/signals/fdm-initialized", func() {
	systemsLoop.start();
	removelistener(fdmInit);
	initDone = 1;
});

var systemsLoop = maketimer(0.1, func() {
	SHAKE.loop();
});

var beacon = aircraft.light.new("/sim/model/lights/beacon", [0.1, 1], "/systems/exterior-lights/beacon");
var strobe = aircraft.light.new("/sim/model/lights/strobe", [0.05, 0.05, 0.05, 1.0], "/systems/exterior-lights/strobe-lights");

# Custom controls.nas overrides
controls.autopilotDisconnect = func() {
	cockpit.ApPanel.apDisc();
}

controls.reverserTogglePosition = func() {
	systems.toggleRevThrust();
}

controls.flapsDown = func(step) {
	pts.Controls.Flight.flapsTemp = pts.Controls.Flight.flaps.getValue();
	if (step == 1) {
		if (pts.Controls.Flight.flapsTemp < 0.2) {
			pts.Controls.Flight.flaps.setValue(0.2);
		} else if (pts.Controls.Flight.flapsTemp < 0.36) {
			pts.Controls.Flight.flaps.setValue(0.36);
		} else if (pts.Controls.Flight.flapsTemp < 0.52) {
			pts.Controls.Flight.flaps.setValue(0.52);
		} else if (pts.Controls.Flight.flapsTemp < 0.68) {
			pts.Controls.Flight.flaps.setValue(0.68);
		} else if (pts.Controls.Flight.flapsTemp < 0.84) {
			pts.Controls.Flight.flaps.setValue(0.84);
		}
	} else if (step == -1) {
		if (pts.Controls.Flight.flapsTemp > 0.68) {
			pts.Controls.Flight.flaps.setValue(0.68);
		} else if (pts.Controls.Flight.flapsTemp > 0.52) {
			pts.Controls.Flight.flaps.setValue(0.52);
		} else if (pts.Controls.Flight.flapsTemp > 0.36) {
			pts.Controls.Flight.flaps.setValue(0.36);
		} else if (pts.Controls.Flight.flapsTemp > 0.2) {
			pts.Controls.Flight.flaps.setValue(0.2);
		} else if (pts.Controls.Flight.flapsTemp > 0) {
			pts.Controls.Flight.flaps.setValue(0);
		}
	}
}

controls.stepSpoilers = func(step) {
	if (step == 1) {
		deploySpeedbrake();
	} else if (step == -1) {
		retractSpeedbrake();
	}
}

var speedbrakeKey = func() {
	pts.Controls.Flight.speedbrakeTemp = pts.Controls.Flight.speedbrake.getValue();
	if (pts.Gear.wow[1].getBoolValue() or pts.Gear.wow[2].getBoolValue()) {
		if (pts.Controls.Flight.speedbrakeTemp < 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.6) {
			pts.Controls.Flight.speedbrake.setValue(0.6);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.8) {
			pts.Controls.Flight.speedbrake.setValue(0.8);
		} else {
			pts.Controls.Flight.speedbrake.setValue(0);
		}
	} else {
		if (pts.Controls.Flight.speedbrakeTemp < 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.8) { # Not 0.6!
			pts.Controls.Flight.speedbrake.setValue(0.8); # Not 0.6!
		} else {
			pts.Controls.Flight.speedbrake.setValue(0);
		}
	}
}

var deploySpeedbrake = func() {
	pts.Controls.Flight.speedbrakeTemp = pts.Controls.Flight.speedbrake.getValue();
	if (pts.Gear.wow[1].getBoolValue() or pts.Gear.wow[2].getBoolValue()) {
		if (pts.Controls.Flight.speedbrakeTemp < 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.6) {
			pts.Controls.Flight.speedbrake.setValue(0.6);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.8) {
			pts.Controls.Flight.speedbrake.setValue(0.8);
		}
	} else {
		if (pts.Controls.Flight.speedbrakeTemp < 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp < 0.8) { # Not 0.6!
			pts.Controls.Flight.speedbrake.setValue(0.8); # Not 0.6!
		}
	}
}

var retractSpeedbrake = func() {
	pts.Controls.Flight.speedbrakeTemp = pts.Controls.Flight.speedbrake.getValue();
	if (pts.Gear.wow[1].getBoolValue() or pts.Gear.wow[2].getBoolValue()) {
		if (pts.Controls.Flight.speedbrakeTemp > 0.6) {
			pts.Controls.Flight.speedbrake.setValue(0.6);
		} else if (pts.Controls.Flight.speedbrakeTemp > 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp > 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp > 0) {
			pts.Controls.Flight.speedbrake.setValue(0);
		}
	} else {
		if (pts.Controls.Flight.speedbrakeTemp > 0.4) {
			pts.Controls.Flight.speedbrake.setValue(0.4);
		} else if (pts.Controls.Flight.speedbrakeTemp > 0.2) {
			pts.Controls.Flight.speedbrake.setValue(0.2);
		} else if (pts.Controls.Flight.speedbrakeTemp > 0) {
			pts.Controls.Flight.speedbrake.setValue(0);
		}
	}
}

var delta = 0;
var output = 0;
var slewProp = func(prop, delta) {
	delta *= pts.Sim.Time.deltaRealtimeSec.getValue();
	output = props.globals.getNode(prop).getValue() + delta;
	props.globals.getNode(prop).setValue(output);
	return output;
}

controls.elevatorTrim = func(d) {
	slewProp("/controls/flight/elevator-trim", d * (0.3 / 16));
}

setlistener("/controls/flight/elevator-trim", func() {
	if (pts.Controls.Flight.elevatorTrim.getValue() > 0.0625) {
		pts.Controls.Flight.elevatorTrim.setValue(0.0625);
	}
}, 0, 0);

# Override FG's generic brake
controls.applyBrakes = func(v, which = 0) { # No interpolate, that's bad, we will apply rate-limit in JSBSim
	if (which <= 0) {
		pts.Controls.Gear.brakeLeft.setValue(v);
	}
	if (which >= 0) {
		pts.Controls.Gear.brakeRight.setValue(v);
	}
}

if (pts.Controls.Flight.autoCoordination.getBoolValue()) {
	pts.Controls.Flight.autoCoordination.setBoolValue(0);
	pts.Controls.Flight.aileronDrivesTiller.setBoolValue(1);
} else {
	pts.Controls.Flight.aileronDrivesTiller.setBoolValue(0);
}

setlistener("/controls/flight/auto-coordination", func() {
	pts.Controls.Flight.autoCoordination.setBoolValue(0);
	print("System: Auto Coordination has been turned off as it is not compatible with the flight control system of this aircraft.");
	screen.log.write("Auto Coordination has been disabled as it is not compatible with the flight control system of this aircraft", 1, 0, 0);
});

# Shaking Logic
var SHAKE = {
	force: 0,
	rollspeedMs: [0, 0, 0, 0, 0],
	wow: [0, 0, 0, 0, 0],
	loop: func() {
		me.rollspeedMs[0] = pts.Gear.rollspeedMs[0].getValue();
		me.rollspeedMs[1] = pts.Gear.rollspeedMs[1].getValue();
		me.rollspeedMs[2] = pts.Gear.rollspeedMs[2].getValue();
		me.rollspeedMs[3] = pts.Gear.rollspeedMs[3].getValue();
		me.rollspeedMs[4] = pts.Gear.rollspeedMs[4].getValue();
		me.wow[0] = pts.Gear.wow[0].getBoolValue();
		me.wow[1] = pts.Gear.wow[1].getBoolValue();
		me.wow[2] = pts.Gear.wow[2].getBoolValue();
		me.wow[3] = pts.Gear.wow[3].getBoolValue();
		me.wow[4] = pts.Gear.wow[4].getBoolValue();
		
		if (pts.Velocities.groundspeedKt.getValue() >= 1 and (me.wow[0] or me.wow[1] or me.wow[2] or me.wow[3] or me.wow[4])) {
			if (me.wow[0]) {
				me.force = me.rollspeedMs[0] / 94000;
			} else {
				me.force = math.max(me.rollspeedMs[1], me.rollspeedMs[2], me.rollspeedMs[3], me.rollspeedMs[4]) / 188000;
			}
			
			interpolate(pts.Systems.Shake.shaking, 0, 0.03);
			settimer(func() {
				interpolate(pts.Systems.Shake.shaking, me.force * 1.5, 0.03); 
			}, 0.5);
		} else {
			pts.Systems.Shake.shaking.setBoolValue(0);
		}	    
	},
};
