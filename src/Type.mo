
module {

    // Metadata of a Project.
    public type Metadata = {
        name            : Text; // Name of the Project.
        canisterId      : Text; // canister id of the Project
        website         : Text; // website
        logo            : ?Text; // logo
        brief           : ?Text; // Project brief
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
    
};
