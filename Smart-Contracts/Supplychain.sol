pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";
import "./owned.sol";
/**
* @title procurement
* @author Abhishek Vispute
*/


contract Procurement is owned{
   using SafeMath for uint256;
   address temp;
   //event TokensSent(address _from, address _to, uint _amount);
    
   
   struct State {
       address holder;
       uint256 timestampArrived;
       uint256 timestampShipped;
       address nextStop;
       
       address payable vendor;
       uint quotation;
       bool Status;
   }

   
   //itemid-> state
   mapping(uint256 => State) public PresentConditionOfItem;
   //itemid-> history
   mapping(uint256 => State[]) public History;
   //holder -> bool
   mapping(address => bool) public listedholders;
   //item -> bool
   mapping(uint256 => bool) public listedItems;
   
   constructor()public{
        listedholders[owner] =true;
    }
   
   function shipNext(uint256 _itemid, address _nextStop) public
   {
       require(PresentConditionOfItem[_itemid].holder==msg.sender, "You are not holder");
       require(listedholders[_nextStop]==true,"Next Stop is not registered");
       
       PresentConditionOfItem[_itemid].nextStop =_nextStop;
       PresentConditionOfItem[_itemid].timestampShipped = now;
       History[_itemid].push(PresentConditionOfItem[_itemid]);
       //emit TokensSent(msg.sender, _to, _amount);
   }
   function updateStateOfArrivedItem(uint256 _itemid) public
   {
       State[] memory s =History[_itemid];
       require(s[s.length-1].nextStop==msg.sender,"Invalid receiver");
      
       if(msg.sender==owner)
       {
       require(listedItems[_itemid] == true,"Invalid Item");
       //Add functions here if any intermediate is missed
       SetPresentConditon(_itemid,msg.sender,now,0,temp,PresentConditionOfItem[_itemid].vendor,PresentConditionOfItem[_itemid].quotation,false);
       History[_itemid].push(PresentConditionOfItem[_itemid]);
       SendMoney(_itemid);
       }
       else
       {
       require(listedItems[_itemid] == true,"Invalid Item");
       require(PresentConditionOfItem[_itemid].nextStop==msg.sender, "You are not expected receiver");
       SetPresentConditon(_itemid,msg.sender,now,0,temp,PresentConditionOfItem[_itemid].vendor,PresentConditionOfItem[_itemid].quotation,true);
       }
       
      
       
   }
   function getHistory(uint256 _itemid) public view returns (address[] memory,uint[] memory,uint[] memory,address[] memory, address payble,uint,bool)
   {
        State[] memory s =History[_itemid];
    
        address[] memory holder = new address[](s.length);
        uint[]    memory timestampArrived = new uint[](s.length);
        uint[]    memory timestampShipped = new uint[](s.length);
        address[] memory nextStop = new address[](s.length);
      
       // bool[]    memory status = new uint[](s.length);
        
        address payable  _vendor;
        uint _quotation;
        //State[] memory s =History[_itemid];
        _vendor = s[0].vendor;
        _quotation= s[0].quotation;
        bool _status=s[s.length-1].Status;
        for (uint i = 0; i < s.length; i++) {
            
            State memory t =s[i];
            holder[i] = t.holder;
            timestampArrived[i] = t.timestampArrived;
            timestampShipped[i] = t.timestampShipped;
            nextStop[i] = t.nextStop;
           // status[i]=t.Status;
        }
        return (holder, timestampArrived,timestampShipped,nextStop,_vendor,_quotation,_status);
   }
   
   function getPresentStatus(uint _itemid) public view returns (address _holder, uint256 _timestampArrived, uint _timestampShipped, address _nextStop, address payable _vendor, uint _quotation, bool _status)
   {
       State memory s = PresentConditionOfItem[_itemid];
       return (s.holder, s.timestampArrived, s.timestampShipped, s.nextStop, s.vendor,s.quotation,s.Status);
   }
  
   function addHolder(address _newholder) public onlyowner
   {
       listedholders[_newholder] = true ;
   }

   function allotItemToVendor(uint256 _itemid,address payable _vendor,uint256 _quotation) public onlyowner
   {
       require(listedItems[_itemid] == false,"This Item id is not available");
       listedItems[_itemid]= true;
       listedholders[_vendor]=true;
      
       SetPresentConditon(_itemid,_vendor,now,0,temp,_vendor,_quotation,true);
 
   }
   
   function SetPresentConditon(uint256 _itemid, address _holder,uint256 _timeArr, uint256 _timeShipped, address _nextStop, address payable _vendor,uint256 _quotation,bool _status) internal
   {
        PresentConditionOfItem[_itemid] =State(
            _holder,
            _timeArr,
            _timeShipped,
            _nextStop,
            _vendor,
            _quotation,
            _status
        );
   }
   
   function SendMoney(uint256 _itemid) private
   {
       //add functions to adjust quotation
       PresentConditionOfItem[_itemid].vendor.transfer(PresentConditionOfItem[_itemid].quotation);
   }
   function getBalance() public view onlyowner returns(uint)
   {
       return address(this).balance;
   }
  
   function () external payable {
   
    }
    
    function destroySmartContract(address payable _to) public onlyowner {
    
    selfdestruct(_to);
    }

}