# McDonnell Douglas MD-12 Property Tree Setup
# Copyright (c) 2026 Josh Davidson (Octal450)
# Nodes organized like property tree, except when lots of identical (example: Gear wow), where vectors are used to make it easier
# Anything that says Temp is set by another file to avoid multiple getValue calls
# Usage Example: pts.Class.SubClass.node.getValue()

var Controls = {
	Flight: {
		aileronDrivesTiller: props.globals.getNode("/controls/flight/aileron-drives-tiller"),
		aileronTrim: props.globals.getNode("/controls/flight/aileron-trim"),
		autoCoordination: props.globals.getNode("/controls/flight/auto-coordination", 1),
		elevatorTrim: props.globals.getNode("/controls/flight/elevator-trim"),
		flaps: props.globals.getNode("/controls/flight/flaps"),
		flapsTemp: 0,
		rudderTrim: props.globals.getNode("/controls/flight/rudder-trim"),
		speedbrake: props.globals.getNode("/controls/flight/speedbrake"),
		speedbrakeTemp: 0,
	},
	Gear: {
		brakeLeft: props.globals.getNode("/controls/gear/brake-left"),
		brakeRight: props.globals.getNode("/controls/gear/brake-right"),
	},
};

var Fdm = {
	JSBSim: {
		Propulsion: {
			Engine: {
				n1: [props.globals.getNode("/fdm/jsbsim/propulsion/engine[0]/n1"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[1]/n1"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[2]/n1"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[3]/n1")],
				n2: [props.globals.getNode("/fdm/jsbsim/propulsion/engine[0]/n2"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[1]/n2"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[2]/n2"), props.globals.getNode("/fdm/jsbsim/propulsion/engine[3]/n2")],
			},
			setRunning: props.globals.getNode("/fdm/jsbsim/propulsion/set-running"),
		},
	},
};

var Gear = {
	rollspeedMs: [props.globals.getNode("/gear/gear[0]/rollspeed-ms"), props.globals.getNode("/gear/gear[1]/rollspeed-ms"), props.globals.getNode("/gear/gear[2]/rollspeed-ms"), props.globals.getNode("/gear/gear[3]/rollspeed-ms"), props.globals.getNode("/gear/gear[4]/rollspeed-ms")],
	wow: [props.globals.getNode("/gear/gear[0]/wow"), props.globals.getNode("/gear/gear[1]/wow"), props.globals.getNode("/gear/gear[2]/wow"), props.globals.getNode("/gear/gear[3]/wow"), props.globals.getNode("/gear/gear[4]/wow")],
};

var Instrumentation = {
	Pfd: {
		altFl: props.globals.getNode("/instrumentation/pfd/alt-fl"),
		altHundred: props.globals.getNode("/instrumentation/pfd/alt-hundred"),
		apLat: props.globals.getNode("/instrumentation/pfd/ap-lat"),
		apLatArm: props.globals.getNode("/instrumentation/pfd/ap-lat-arm"),
		apVert: props.globals.getNode("/instrumentation/pfd/ap-vert"),
		apVertArm: props.globals.getNode("/instrumentation/pfd/ap-vert-arm"),
	},
};

var Position = {
	gearAglFt: props.globals.getNode("/position/gear-agl-ft"),
	node: props.globals.getNode("/position"),
	wow: props.globals.getNode("/position/wow"),
	wowTemp: 0,
};

var Sim = {
	CurrentView: {
		fieldOfView: props.globals.getNode("/sim/current-view/field-of-view", 1),
		headingOffsetDeg: props.globals.getNode("/sim/current-view/heading-offset-deg", 1),
		name: props.globals.getNode("/sim/current-view/name", 1),
		pitchOffsetDeg: props.globals.getNode("/sim/current-view/pitch-offset-deg", 1),
		rollOffsetDeg: props.globals.getNode("/sim/current-view/roll-offset-deg", 1),
		viewNumber: props.globals.getNode("/sim/current-view/view-number", 1),
		viewNumberRaw: props.globals.getNode("/sim/current-view/view-number-raw", 1),
		xOffsetM: props.globals.getNode("/sim/current-view/x-offset-m", 1),
		yOffsetM: props.globals.getNode("/sim/current-view/y-offset-m", 1),
		zOffsetDefault: props.globals.getNode("/sim/current-view/z-offset-default", 1),
		zOffsetM: props.globals.getNode("/sim/current-view/z-offset-m", 1),
		zOffsetMaxM: props.globals.getNode("/sim/current-view/z-offset-max-m", 1),
		zOffsetMinM: props.globals.getNode("/sim/current-view/z-offset-min-m", 1),
	},
	Rendering: {
		Headshake: {
			enabled: props.globals.getNode("/sim/rendering/headshake/enabled"),
		},
	},
	Replay: {
		replayState: props.globals.getNode("/sim/replay/replay-state"),
	},
	Time: {
		deltaRealtimeSec: props.globals.getNode("/sim/time/delta-realtime-sec"),
		elapsedSec: props.globals.getNode("/sim/time/elapsed-sec"),
	},
	View: {
		Config: {
			defaultFieldOfViewDeg: props.globals.getNode("/sim/view/config/default-field-of-view-deg", 1),
		},
	},
};

var Systems = {
	Shake: {
		shaking: props.globals.getNode("/systems/shake/shaking"),
	},
};

var Velocities = {
	groundspeedKt: props.globals.getNode("/velocities/groundspeed-kt"),
	groundspeedKtTemp: 0,
};
