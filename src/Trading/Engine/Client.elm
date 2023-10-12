module Trading.Engine.Client exposing (..)

import Morphir.SDK.StatefulApp exposing (StatefulApp(..))

-- import String exposing (contains, toLower)
-- import Regex exposing (Regex, match, regex)



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
    -- | EmailIsInvalid
    | EmailAlreadyExists
    | InvalidPassword
    
-- Validation

validateClientName : String -> Result ValidationError String
validateClientName name =
    if String.isEmpty name then
        Err NameCannotBeBlank
    else
        Ok name

validateClientEmail : (String -> Bool) -> String -> Result ValidationError String
validateClientEmail emailExists email =
    if email == Nothing then
        Err EmailCannotBeNull
    -- else if not (isValidEmail email) then
    --     Err EmailIsInvalid
    else if emailExists email then
        Err EmailAlreadyExists
    else
        Ok email

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

-- isValidEmail : String -> Bool
-- isValidEmail email =
--     -- Simplified email regex check
--     let
--         regex =
--             "^[A-Za-z0-9+_.-]+@(.+)$"
--     in
--     Regex.contains (Regex.fromString regex) email



-- type alias ValidationResult =
--     { isValid : Bool
--     , message : String
--     }

 

-- validateEmail : String -> ValidationResult
-- validateEmail email =
--     let
--         emailRegex : Regex
--         emailRegex =
--             regex "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"

 

--         lowercaseEmail =
--             toLower email
--     in
--     if String.isEmpty email then
--         { isValid = False, message = "Email cannot be empty" }
--     else if match emailRegex lowercaseEmail == Just lowercaseEmail then
--         { isValid = True, message = "Email is valid" }
--     else
--         { isValid = False, message = "Email is not in a valid format" }