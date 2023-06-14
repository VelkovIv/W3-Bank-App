import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;

  let id = 652738392020;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    if (amount >= 0) {
      currentValue += amount;
      Debug.print(debug_show(currentValue));
    }
  };

  public func withdrawl(amount: Float){
    if (currentValue >= amount) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Not enough money");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  // topUp();

  public func compaound() {
    let currentTime = Time.now();
    let timeElapsedS = (currentTime - startTime) / 1_000_000_000;
    currentValue := currentValue * (1.01 **Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}
