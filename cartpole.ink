inkling "2.0"

type State {
    position: number,
    velocity: number,
    angle:    number,
    rotation: number
}

type Action {
    command: number<left=0, right=1>
}

simulator the_simulator(action: Action): State {
}

graph (input: State): Action {

    concept balance(input): Action {
        curriculum {
            source the_simulator
        }
    }
    output balance
}
