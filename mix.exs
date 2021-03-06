#
# This file is part of Astarte.
#
# Copyright 2019 Ispirata Srl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

defmodule Astarte.Streams.MixProject do
  use Mix.Project

  def project do
    [
      app: :astarte_streams,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:lager, :logger],
      mod: {Astarte.Streams.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:astarte_device, github: "astarte-platform/astarte-device-sdk-elixir"},
      {:astarte_core, github: "astarte-platform/astarte_core"},
      {:cyanide, github: "ispirata/cyanide"},
      {:certifi, "~> 2.5"},
      {:tortoise, "~> 0.9"},
      {:elixir_uuid, "~> 1.2"},
      {:excoveralls, "~> 0.10", only: :test},
      {:exjsonpath, github: "ispirata/exjsonpath"},
      {:gen_stage, "~> 0.14"},
      {:hackney, "~> 1.15"},
      {:tesla, "~> 1.2"},
      {:dialyzex, "~> 1.2", only: :dev},
      {:mox, "~> 0.5", only: :test},
      {:jason, "~> 1.1"},
      {:luerl, "~> 0.3"},
      {:prioqueue, "~> 0.2.0"},
      {:amqp, "~> 1.3"},
      {:phoenix, "~> 1.4.11"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
