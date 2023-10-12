module Trading.Engine.Client exposing (..)

import Morphir.SDK.StatefulApp exposing (StatefulApp(..))


-- Types

type alias ClientId = 
 String 

-- type alias Role = 
--     User

type alias Client =
    { name : Maybe String
    , email : Maybe String
    , password : Maybe String
    -- , role : Role
    }

type ValidationError
    = NameCannotBeBlank
    | EmailCannotBeNull
    | EmailIsInvalid
    | EmailAlreadyExists
    | InvalidPassword
    
-- Validation

validateClientName : String -> Result ValidationError String
validateClientName name =
    if String.isEmpty name then
        Err NameCannotBeBlank
    else
        Ok name


validateClientPassword : String -> Result ValidationError String
validateClientPassword password =
    if String.isEmpty password then
        Err InvalidPassword
    else if String.length password < 8 then
        Err InvalidPassword
    else if not (String.any Char.isUpper password) then
        Err InvalidPassword
    else if not (String.any Char.isLower password) then
        Err InvalidPassword
    -- Add further checks for numbers and special characters
    else
        Ok password

validateEmail : String -> Result ValidationError String
validateEmail email =       
    if String.isEmpty email then
        Err EmailCannotBeNull
    else
        Ok email