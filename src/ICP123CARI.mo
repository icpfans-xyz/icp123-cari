import Result "mo:base/Result";

module {


    // Metadata of a Project.
    public type Metadata = {
        projectId            : Text; // Name of the Project.
        projectName          : Text; // Name of the Project
        // TODO: add more fields (e.g. genre, ...)
    };


    // Canister data registry
    public type CARData = {
        principalId      : Text;  // Principal ID of caller
        accountId        : ?Text; // Account ID of caller
        funcName         : Text; // Called function Name
        actionType       : Text; // Action type
        context          : ?Text; // Custom content
        creatTime        : Int; // Call time
        // TODO: add more fields (e.g. genre, ...)
    };

    // Represents the interface of a Register canister what wants to interact with 
    // the ICP123 canister.
    public type RegisterInterface = actor {

        // Function so the register (actor) can register itself.
        icp123RegisterSelf :   shared (RegisterCallback) -> async ();
    };

    // Callback on which new games should register.
    public type RegisterCallback = shared (
        // Metadata of the game itself.
        metadata : Metadata
    ) -> async ();


    // Represents the (minimal) interface of the Metascore canister.
    public type ICP123Interface = actor {

        // Interact registration information with ICP123
        registerCanister : (Metadata) -> async Result.Result<(), Text>;

        // Get the canisterId of the graphql query
        getICP123CARGraphCanisterId :   shared (Text) -> async Result.Result<Text, Text>;

        // Upload function data that needs statistics to ICP123CAR, IC P123 provides display dashboard
        uploadICP123CAR     : shared (CARData) -> async Result.Result<(), Text>;
        
    };
};
