package com.openclaw.go
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                var text by remember { mutableStateOf("") }
                var response by remember { mutableStateOf("Ready") }
                Column(Modifier.fillMaxSize().padding(16.dp)) {
                    OutlinedTextField(value = text, onValueChange = { text = it }, modifier = Modifier.fillMaxWidth())
                    Spacer(Modifier.height(8.dp))
                    Button(onClick = { response = "Thinking..." /* API call yahan aayega */ }, modifier = Modifier.fillMaxWidth()) { Text("Run Agent") }
                    Spacer(Modifier.height(12.dp))
                    Card { Text(response, modifier = Modifier.padding(12.dp)) }
                }
            }
        }
    }
}
