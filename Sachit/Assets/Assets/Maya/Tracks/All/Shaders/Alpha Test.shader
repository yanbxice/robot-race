Shader "Custom/Alpha Test" {
       
    Properties
    {
       _Cutoff ("Alpha Cutoff", Range (0,1)) = .5
       _MainTex ("Texture", 2D) = ""
    }

    SubShader
    {
       Tags {"Queue" = "Geometry+100"}
       Cull off
       AlphaTest Greater [_Cutoff]
       Pass {SetTexture[_MainTex]}
    }

}
