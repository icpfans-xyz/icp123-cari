import Result "mo:base/Result";
import Type "Type"

module {

    type CARData = Type.CARData;
    type Metadata = Type.Metadata;

    // Represents the interface of a Register canister what wants to interact with 
    // the ICP123 canister.
    public type RegisterInterface = actor {
        // Endpoint that returns the data of the storage sudograph canister id.
        // This will be called to sync all event data. Registers are 
        // responsible to update the data in the ICP123 canister 
        // themselves, by calling the 'icp123CAR' endpoint. 
        icp123CARSudograph :   query () -> async Result.Result<(), Text>;

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
        // Methods that needs to be called to register 
        // Can be called by any principal account. CARData will register
        // itself by calling the callback given in 'icp123RegisterSelf'.
        getIcp123CARSudograph :   query (Text) -> async Result.Result<Principal, Text>;

        // Methods that needs to be called to register 
        // Can be called by any principal account. CARData will register
        // itself by calling the callback given in 'icp123RegisterSelf'.
        sendICP123CAR     : shared (CARData) -> async Result.Result<(), Text>;

        // Endpoint to send CARData updates to.
        updateICP123CAR   : shared ([CARData]) -> async Result.Result<(), Text>;
    };
};
