package trading.engine

/** Generated based on Client
*/
case class StatefulApp[K, C, S, E](
  businessLogic: morphir.sdk.Maybe.Maybe[S] => C => (morphir.sdk.Maybe.Maybe[S], E)
){}