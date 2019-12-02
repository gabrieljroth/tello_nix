# Tello App

1. Install the [Nix package manager][https://nixos.org/nix]:

   ```sh
   curl https://nixos.org/nix/install | sh
   ```

2. Build the application

   ```sh
   # Must be executed from this directory
   nix-build
   ```

3. Run the application

   ```sh
   ./result/main.py
   ```
