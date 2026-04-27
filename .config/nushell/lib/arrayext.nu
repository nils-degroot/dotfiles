# Returns a random entry from the input array
export def random [ ]: list<any> -> any {
  let array = $in
  let index = random int ..( ( $in | length ) - 1 )
  $in | get $index
}
