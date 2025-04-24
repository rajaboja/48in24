export class InvalidInputError extends Error {
  constructor(message: string) {
    super()
    this.message = message || 'Invalid Input'
  }
}

type Direction = 'north' | 'east' | 'south' | 'west'
type Coordinates = [number, number] 
const dirs = ['north','east','south','west']

export class Robot {
  private _bearing: Direction = 'north'
  private _coordinates:Coordinates = [0,0]
  
  get bearing(): Direction {
    return this._bearing
  }

  get coordinates(): Coordinates {
    return this._coordinates
  }

  place(args: { x: number; y: number; direction: string }) {
    if (! dirs.includes(args.direction)){
      throw new InvalidInputError('not a valid value for direction')
    }
    this._bearing = args.direction as Direction
    this._coordinates = [args.x,args.y] as Coordinates
  }

  evaluate(instructions: string) {
    let idx = dirs.indexOf(this._bearing)
    for (const i of instructions){
      switch (i) {
        case 'R':
          idx = (idx+1)%4
          this._bearing = dirs[idx] as Direction
          break;
        case 'L':
          idx = (idx+3)%4
          this._bearing = dirs[idx] as Direction
          break;
        case 'A':
          this._coordinates[(idx+1)%2] += idx>1? -1:1
      } 
    }
  }
}
