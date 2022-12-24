import AudioKit

// Set up an oscillator to generate the input signal
let oscillator = AKOscillator()

// Set up an autotuner to process the input signal
let autotuner = AKAutotuner(oscillator)

// Set the target pitch for the autotuner
autotuner.targetPitch = 440.0

// Start the oscillator
oscillator.start()

// Start the autotuner
autotuner.start()

// Connect the autotuner to the output
AudioKit.output = autotuner

// Start the audio engine
try AudioKit.start()
