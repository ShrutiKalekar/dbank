import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currVal: Float = 300;
  currVal := 500;
  // let id = 65456945438703;
  // Debug.print(debug_show(currVal));

  // type Time = Int;
  stable var now : Int = Time.now();
  now := Time.now();
  Debug.print(debug_show(now));

  public func topUp(amount: Float) {
    currVal += amount;
    Debug.print(debug_show(currVal));
  };
  
  public func topDown(amount: Float){
    let val: Float = currVal - amount;
    if( val >= 0){
      currVal -= amount;
      Debug.print(debug_show(currVal));
    } else {
      Debug.print(debug_show("You don't have enough amount in the bank"));
    }
  };

  public query func checkBalance (): async Float { //quick function
    return(currVal); //read only operation
  };
  
  public func compound() {
    let currTime = Time.now();
    let timeElapsedNS = currTime - now;
    let timeElapsedS = timeElapsedNS/1000000000;
    currVal := currVal * (1.001  ** Float.fromInt(timeElapsedS));
    now := currTime;
  };

  // topUp();

};
 