package config

import (
	"log"

	"github.com/caarlos0/env/v10"
	"github.com/joho/godotenv"
)

type config struct {
	// General
	DatabaseURL string `env:"DATABASE_URL" envDefault:"database.db"`
	Port        int    `env:"PORT" envDefault:"8080"`

	// GROQ
	GroqKey       string `env:"GROQ_API_KEY"`
	GroqModel     string `env:"GROQ_MODEL" envDefault:"mixtral-8x7b-32768"`
	GroqServerURL string `env:"GROQ_SERVER_URL" envDefault:"https://api.groq.com/openai/v1"`

	// Ollama
	OllamaModel     string `env:"OLLAMA_MODEL"`
	OllamaServerURL string `env:"OLLAMA_SERVER_URL" envDefault:"http://localhost:11434"`
}

var Config config

func Init() {
	godotenv.Load()

	if err := env.ParseWithOptions(&Config, env.Options{
		RequiredIfNoDef: false,
	}); err != nil {
		log.Fatalf("Unable to parse config: %v\n", err)
	}
}
