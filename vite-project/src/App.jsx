import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import { useEffect } from 'react'

export function fetchBackend(){
  const url = "http://localhost:3000/datos"
  useEffect(()=>{
    fetch(url).then(respuesta => respuesta.json()).then(data => console.log(data))
  },[])

  return(
    <h1>Hello world</h1>
  )
}
