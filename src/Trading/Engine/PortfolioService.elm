module Trading.Engine.PortfolioService exposing (..)

import Morphir.SDK.StatefulApp exposing (StatefulApp(..))

type alias ID = 
    Int --get back to it later

type alias Name =
 String


type alias DefaultPortfolio = 
 Bool

type alias Email =
 String

type alias Password =
 String


type alias Role =
 String

type alias Client = 
    { id: ID
    , name : Name
    , email: Email
    , password: Password
    , role: Role
    }



type alias Portfolio =
    { id : ID
    , name : Name
    , defaultPortfolio : DefaultPortfolio
    , client: Client
    }


{- These define the requests that can be made of this service -}
type PortfolioRequests 
    = CreatePortfolio Name ID


type PortfolioResponses
    = PortfolioCreated ID Name DefaultPortfolio ID


