Shader "Custom/Alpha Emissive" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}
	_Color ("Color", Color) = (1,1,1)
	_Specular ("Specular", Color) = (1,1,1)
	_Shininess ("Shininess", Range(0,1)) = .3
}

SubShader {
	Tags { "RenderType"="Opaque" }
	LOD 100
	
	Material
		{
			Diffuse [_Color]
			Specular [_Specular]
			Shininess [_Shininess]
		}
	
	// Non-lightmapped
	Pass {
		Tags { "LightMode" = "Vertex" }
		Lighting On
		
		SetTexture[_MainTex] {Combine texture * primary DOUBLE}
		SetTexture[_MainTex] {Combine texture lerp (texture) previous}
		
	}
	
	// Lightmapped, encoded as dLDR
	Pass {
		Tags { "LightMode" = "VertexLM" }

		Lighting Off
		BindChannels {
			Bind "Vertex", vertex
			Bind "texcoord1", texcoord0 // lightmap uses 2nd uv
			Bind "texcoord", texcoord1 // main uses 1st uv
                        Bind "texcoord", texcoord2
		}
		
		SetTexture [unity_Lightmap] {
			matrix [unity_LightmapMatrix]
			combine texture
		}
		SetTexture [_MainTex] {
			combine texture * previous QUAD 
		}
		
		SetTexture [_MainTex] {
			combine texture lerp (texture) previous
		}
	}
	
	// Lightmapped, encoded as RGBM
	Pass {
		Tags { "LightMode" = "VertexLMRGBM" }
		
		Lighting Off
		BindChannels {
			Bind "Vertex", vertex
			Bind "texcoord1", texcoord0 // lightmap uses 2nd uv
			Bind "texcoord", texcoord1 // main uses 1st uv
			Bind "texcoord", texcoord2
		}
		
		SetTexture [unity_Lightmap] {
			matrix [unity_LightmapMatrix]
			combine texture * texture alpha DOUBLE
		}
		
		SetTexture [_MainTex] {
			combine texture * previous QUAD 
		}
		
		SetTexture [_MainTex] {
			combine texture lerp (texture) previous
		}
	}	
}
}
