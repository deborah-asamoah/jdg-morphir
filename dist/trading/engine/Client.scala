package trading.engine

/** Generated based on Client
*/
object Client{

  final case class Client(
    name: morphir.sdk.Maybe.Maybe[morphir.sdk.String.String],
    email: morphir.sdk.Maybe.Maybe[morphir.sdk.String.String],
    password: morphir.sdk.Maybe.Maybe[morphir.sdk.String.String]
  ){}
  
  type ClientId = morphir.sdk.String.String
  
  sealed trait ValidationError {
  
    
  
  }
  
  object ValidationError{
  
    case object EmailAlreadyExists extends trading.engine.Client.ValidationError{}
    
    case object EmailCannotBeNull extends trading.engine.Client.ValidationError{}
    
    case object EmailIsInvalid extends trading.engine.Client.ValidationError{}
    
    case object InvalidPassword extends trading.engine.Client.ValidationError{}
    
    case object NameCannotBeBlank extends trading.engine.Client.ValidationError{}
  
  }
  
  val EmailAlreadyExists: trading.engine.Client.ValidationError.EmailAlreadyExists.type  = trading.engine.Client.ValidationError.EmailAlreadyExists
  
  val EmailCannotBeNull: trading.engine.Client.ValidationError.EmailCannotBeNull.type  = trading.engine.Client.ValidationError.EmailCannotBeNull
  
  val EmailIsInvalid: trading.engine.Client.ValidationError.EmailIsInvalid.type  = trading.engine.Client.ValidationError.EmailIsInvalid
  
  val InvalidPassword: trading.engine.Client.ValidationError.InvalidPassword.type  = trading.engine.Client.ValidationError.InvalidPassword
  
  val NameCannotBeBlank: trading.engine.Client.ValidationError.NameCannotBeBlank.type  = trading.engine.Client.ValidationError.NameCannotBeBlank
  
  def validateClientName(
    name: morphir.sdk.String.String
  ): morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String] =
    if (morphir.sdk.String.isEmpty(name)) {
      (morphir.sdk.Result.Err((trading.engine.Client.NameCannotBeBlank : trading.engine.Client.ValidationError)) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    } else {
      (morphir.sdk.Result.Ok(name) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    }
  
  def validateClientPassword(
    password: morphir.sdk.String.String
  ): morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String] =
    if (morphir.sdk.String.isEmpty(password)) {
      (morphir.sdk.Result.Err((trading.engine.Client.InvalidPassword : trading.engine.Client.ValidationError)) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    } else if (morphir.sdk.Basics.lessThan(morphir.sdk.String.length(password))(morphir.sdk.Basics.Int(8))) {
      (morphir.sdk.Result.Err((trading.engine.Client.InvalidPassword : trading.engine.Client.ValidationError)) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    } else if (morphir.sdk.Basics.not(morphir.sdk.String.any(morphir.sdk.Char.isUpper)(password))) {
      (morphir.sdk.Result.Err((trading.engine.Client.InvalidPassword : trading.engine.Client.ValidationError)) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    } else if (morphir.sdk.Basics.not(morphir.sdk.String.any(morphir.sdk.Char.isLower)(password))) {
      (morphir.sdk.Result.Err((trading.engine.Client.InvalidPassword : trading.engine.Client.ValidationError)) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    } else {
      (morphir.sdk.Result.Ok(password) : morphir.sdk.Result.Result[trading.engine.Client.ValidationError, morphir.sdk.String.String])
    }

}