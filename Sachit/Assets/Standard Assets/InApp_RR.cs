using UnityEngine;
using System.Collections.Generic;



public class InApp_RR : MonoBehaviour
{
#if UNITY_IPHONE
	private List<StoreKitProduct> _products;
	
	private string[] productIDs = new string[] {"5000Crystal", "15000crystal", "50000crystal"};
	
	public bool canMakePurchase = false;
	public bool gotProducts = false;
	public bool noProducts = false;
	public bool purchaseRequested = false;
	
	public string[] price = new string[3];
	public int[] priceIndex = new int[3];
	public string[] priceSort = new string[3];
	
	public bool purchaseSuccess = false;
	public bool purchaseFailCancel = false;
	
	public string testMsg = "Call Did not work!!!";

	// Use this for initialization
	void Start () 
	{
		// THOSE MONITOR OUR CALLBACKS
		
		// you cannot make any purchases until you have retrieved the products from the server with the requestProductData method
		// we will store the products locally so that we will know what is purchaseable and when we can purchase the products
		StoreKitManager.productListReceived += allProducts =>
		{
			Debug.Log( "received total products: " + allProducts.Count );
			_products = allProducts;

			for (var pIndex = 0; pIndex < _products.Count; pIndex++)
			{
				Debug.Log("Product " + pIndex + " is Called: " + _products[pIndex].productIdentifier + " is Priced at: " + _products[pIndex].price + " in Currency: " + _products[pIndex].currencySymbol);	
				price[pIndex] = (" " + _products[pIndex].price + " " + _products[pIndex].currencySymbol);
				priceSort[pIndex] = price[pIndex];
			}
			
				// now sort our price
			priceIndex[0] = 0;
			priceIndex[1] = 1;
			priceIndex[2] = 2;
			
			System.Array.Sort(priceSort, priceIndex);
			
			Debug.Log("Sorted Price A: " + price[priceIndex[0]] + " on index: " + priceIndex[0]);
			Debug.Log("Sorted Price B: " + price[priceIndex[1]] + " on index: " + priceIndex[1]);
			Debug.Log("Sorted Price C: " + price[priceIndex[2]] + " on index: " + priceIndex[2]);
			
				// this should later only be true if we got ALL of our products
			if (allProducts.Count == 3)
			{				
				gotProducts = true;
			}
			else
			{
				Debug.Log ("CALLBACK!! PRODUCT LIST  was empty!!");
				noProducts = true;
			}
			
		};
		
		StoreKitManager.productListRequestFailed += error =>
		{
			Debug.Log("CALLBACK!! PRODUCT LIST NOT RECEIVED!! Error: " + error);
			
				// store kit fail get list
			Google.analytics.logEvent("purchase", "FAIL", "getProductList");
			
			noProducts = true;
		};
		
		StoreKitManager.purchaseSuccessful += successful =>
		{
			Debug.Log("CALLBACK!! PURCHASE SUCCESSFUL!!! ");
			
			purchaseSuccess = true;
		};
		
		StoreKitManager.purchaseCancelled += cancel =>
		{
			Debug.Log("CALLBACK!! PURCHASE Canceled!!! ");
			
				// store kit fail get list
			Google.analytics.logEvent("purchase", "FAIL", "purchaseCanceled");
			
			purchaseFailCancel = true;
		};
		
		StoreKitManager.purchaseFailed += fail =>
		{
			Debug.Log("CALLBACK!! PURCHASE Failed!!! ");
			
				// store kit fail get list
			Google.analytics.logEvent("purchase", "FAIL", "purchaseFailed");
			
			purchaseFailCancel = true;
		};
		

	}

		// check if we can make a payment
	public void checkCanMakePayment () 
	{
		canMakePurchase = StoreKitBinding.canMakePayments();
		purchaseRequested = true;
		Debug.Log( "StoreKit canMakePayments: " + canMakePurchase );
	}
	
	
		// get our products
	public void getProducts()
	{
		
		Debug.Log( "Get Product IDs" );
			// get our product IDs
		StoreKitBinding.requestProductData( productIDs );
	}
	
		// get our products
	public void restoreProducts()
	{
		
		Debug.Log( "Restore Product History" );
			// get our product IDs
		StoreKitBinding.restoreCompletedTransactions();
	}

		
		// purchase product
	public void buyItem(int item)
	{
			// only buy if we have all our products
		if( _products != null && _products.Count == 3 )
		{
			var product = _products[item];
				
			Debug.Log( "preparing to purchase product: " + product.productIdentifier );
			StoreKitBinding.purchaseProduct( product.productIdentifier, 1 );
		}
		else
		{
			purchaseFailCancel = true;	
		}
	}

	
	void OnGUI_deactivate()
	{
		float yPos = 5.0f;
		float xPos = 5.0f;
		float width = ( Screen.width >= 960 || Screen.height >= 960 ) ? 320 : 160;
		float height = ( Screen.width >= 960 || Screen.height >= 960 ) ? 80 : 40;
		float heightPlus = height + 10.0f;
		
		if( GUI.Button( new Rect( xPos, yPos, width, height ), "Get Can Make Payments" ) )
		{
			bool canMakePayments = StoreKitBinding.canMakePayments();
			Debug.Log( "StoreKit canMakePayments: " + canMakePayments );
		}
		
		
		if( GUI.Button( new Rect( xPos, yPos += heightPlus, width, height ), "Get Product Data" ) )
		{
			// array of product ID's from iTunesConnect.  MUST match exactly what you have there!
			var productIdentifiers = new string[] { "anotherProduct", "tt", "testProduct", "sevenDays", "oneMonthSubsciber" };
			StoreKitBinding.requestProductData( productIdentifiers );
		}
		
		
		if( GUI.Button( new Rect( xPos, yPos += heightPlus, width, height ), "Restore Completed Transactions" ) )
		{
			StoreKitBinding.restoreCompletedTransactions();
		}
		
		
		if( GUI.Button( new Rect( xPos, yPos += heightPlus, width, height ), "Validate Receipt" ) )
		{
			// grab the transactions, then just validate the first one
			List<StoreKitTransaction> transactionList = StoreKitBinding.getAllSavedTransactions();
			if( transactionList.Count > 0 )
				StoreKitBinding.validateReceipt( transactionList[0].base64EncodedTransactionReceipt, true );
		}
		
		// Second column
		xPos = Screen.width - width - 5.0f;
		yPos = 5.0f;
		
		// enforce the fact that we can't purchase products until we retrieve the product data
		if( _products != null && _products.Count > 0 )
		{
			if( GUI.Button( new Rect( xPos, yPos, width, height ), "Purchase Random Product" ) )
			{
				var productIndex = Random.Range( 0, _products.Count );
				var product = _products[productIndex];
				
				Debug.Log( "preparing to purchase product: " + product.productIdentifier );
				StoreKitBinding.purchaseProduct( product.productIdentifier, 1 );
			}
		}
		
		
		if( GUI.Button( new Rect( xPos, yPos += heightPlus, width, height ), "Validate Subscription" ) )
		{
			// grab the transactions and if we have a subscription in there validate it
			List<StoreKitTransaction> transactionList = StoreKitBinding.getAllSavedTransactions();
			foreach( var t in transactionList )
			{
				if( t.productIdentifier == "sevenDays" )
				{
					StoreKitBinding.validateAutoRenewableReceipt( t.base64EncodedTransactionReceipt, "YOUR_SECRET_FROM_ITC", true );
					break;
				}
			}
		}

		
		if( GUI.Button( new Rect( xPos, yPos += heightPlus, width, height ), "Get Saved Transactions" ) )
		{
			List<StoreKitTransaction> transactionList = StoreKitBinding.getAllSavedTransactions();
			
			// Print all the transactions to the console
			Debug.Log( "\ntotal transaction received: " + transactionList.Count );
			
			foreach( StoreKitTransaction transaction in transactionList )
				Debug.Log( transaction.ToString() + "\n" );
		}
		
	}
#endif
}
