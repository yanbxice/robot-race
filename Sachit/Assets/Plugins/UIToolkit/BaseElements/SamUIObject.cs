using UnityEngine;
using System.Collections;


public class SamUIObject : System.Object, IPositionable
{
	public delegate void SamUIObjectTransormChagedDelegate();
	public event SamUIObjectTransormChagedDelegate onTransformChanged;
	
	private GameObject _client; // Reference to the client GameObject
    public GameObject client
    {
    	get { return _client; }
    }
    protected Transform clientTransform; // Cached Transform of the client GameObject
    private SamUIObject _parentSamUIObject;
    public virtual Color color { get; set; } // hack that is overridden in SamUISprite just for animation support
    
    
	/// <summary>
	/// Sets up the client GameObject along with it's layer and caches the transform
	/// </summary>
    public SamUIObject()
    {
		// Setup our GO
		_client = new GameObject( this.GetType().Name );
		_client.transform.parent = SamUI.instance.transform; // Just for orginization in the hierarchy
		_client.layer = SamUI.instance.layer; // Set the proper layer so we only render on the SamUI camera
		
		// Cache the clientTransform
		clientTransform = _client.transform;
    }

	
	#region Transform passthrough properties so we can update necessary verts when changes occur
	
	public virtual float zIndex
	{
		get { return clientTransform.position.z; }
		set
		{
			var pos = clientTransform.position;
			pos.z = value;
			clientTransform.position = pos;
		}
	}

	
	public virtual Vector3 position
	{
		get { return clientTransform.position; }
		set
		{
			clientTransform.position = value;
			if( onTransformChanged != null )
				onTransformChanged();
		}
	}


	public virtual Vector3 localPosition
	{
		get { return clientTransform.localPosition; }
		set
		{
			clientTransform.localPosition = value;
			if( onTransformChanged != null )
				onTransformChanged();
		}
	}
	
	
	public virtual Vector3 eulerAngles
	{
		get { return clientTransform.eulerAngles; }
		set
		{
			clientTransform.eulerAngles = value;
			if( onTransformChanged != null )
				onTransformChanged();
		}
	}


	public virtual Vector3 localScale
	{
		get { return clientTransform.localScale; }
		set
		{
			clientTransform.localScale = value;
			if( onTransformChanged != null )
				onTransformChanged();
		}
	}
	
	
	public virtual Transform parent
	{
		get { return clientTransform.parent; }
		set { clientTransform.parent = value; }
	}
	

	/// <summary>
	/// Setting the parentSamUIObject automatically sets up a listener for changes to the tranform.
	/// When the parent transform changes, SamUISprite's will automatically call updateTransform to keep their
	/// touch frames and actual positions in sync with the parent
	/// </summary>
	public SamUIObject parentSamUIObject
	{
		get { return _parentSamUIObject; }
		set
		{
			if( value == _parentSamUIObject )
				return;
			
			// remove the old listener if we have one
			if( _parentSamUIObject != null )
				_parentSamUIObject.onTransformChanged -= transformChanged;
			
			// reparent the SamUIObject in the same SamUIToolkit tree as it's children
			//if( value != null && value.parent != parent )
			//	value.parent = parent;
						
			_parentSamUIObject = value;
			
			// if we got a null value, then we are being removed from the SamUIObject so reparent to our manager
			if( _parentSamUIObject != null )
			{
				clientTransform.parent = _parentSamUIObject.clientTransform;
			}
			else
			{
				if( this.GetType() == typeof( SamUISprite ) )
					clientTransform.parent = ((SamUISprite)this).manager.transform;
				else
					clientTransform.parent = null;
			}
			
			// add the new listener
			_parentSamUIObject.onTransformChanged += transformChanged;
		}
	}
	
	#endregion
	
	
	public virtual void transformChanged()
	{
		
	}
	
	
	#region IPositionable implementation
	
	// subclasses should implement these methods if they want to take part in positioning!
	public float width
	{
		get { throw new System.NotImplementedException(); }
	}
	
	
	public float height
	{
		get { throw new System.NotImplementedException(); }
	}
	
	#endregion

}
