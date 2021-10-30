-- let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.4.3-20200916/package-set.dhall sha256:3e1d8d20e35550bc711ae94f94da8b0091e3a3094f91874ff62686c070478dd7
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

-- This is where you can add your own packages to the package-set
let additions = [
  { dependencies = [] : List Text
  , name = "base"
  , repo = "https://github.com/dfinity/motoko-base"
  , version = "dfx-0.8.0"
  }
] : List Package

let
  {- This is where you can override existing packages in the package-set

     For example, if you wanted to use version `v2.0.0` of the foo library:
     let overrides = [
         { name = "foo"
         , version = "v2.0.0"
         , repo = "https://github.com/bar/foo"
         , dependencies = [] : List Text
         }
     ]
  -}
  overrides =
    [] : List Package

in  additions # overrides
