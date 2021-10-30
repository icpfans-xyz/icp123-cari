import Result "mo:base/Result";
import ICP123CARI "mo:icp123cari/ICP123CARI";

shared ({caller = owner}) actor class ICP123CRDExample() : async ICP123CARI.RegisterInterface {
    

   
    type CARData = ICP123CARI.CARData;

    // private var _likesMap = HashMap.HashMap<Principal, Bool>(1, Principal.equal, Principal.hash);



    public query func icp123CARSudograph(canisterId : Text) : async Result.Result<(), Text>{
        #ok();
    };

    // Methods that needs to be called to register 
    // Can be called by any principal account. CARData will register
    // itself by calling the callback given in 'icp123RegisterSelf'.
    public shared({caller}) func icp123CAR(data : CARData) : async Result.Result<(), Text>{
        #ok();
    };

    // Endpoint to send CARData updates to.
    public shared({caller}) func  crdDataUpdate(datas : [CARData]) : async (){
        
    };
    
};
