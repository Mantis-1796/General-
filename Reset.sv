🔹 What is Reset in Flip-Flops?
   A reset is used to initialize a register/flip-flop to a known value (usually 0).

There are 2 types:
- Asynchronous Reset
- Synchronous Reset
//-----------------------------------------------------------------------------//
🔴 1. Asynchronous Reset
✅ Reset happens immediately, independent of clock. Doesn’t wait for clock edge
      always @(posedge clk or posedge rst) begin
        if (rst)
           q <= 0;
        else
           q <= d;
      end
✅ Behavior
   - If rst = 1 → output resets instantly
   - Clock is not required
📊 Timeline idea:
clk :   ↑    ↑    ↑
rst :  ----1---------
q   :      0 immediately

✅ Advantages
   - Fast reset (useful during power-up)
   - Works even if clock is not stable
   - used in power-up logic.
❌ Disadvantages
   - Can cause metastability when deasserting reset
   - Harder to verify (important for you as DV engineer)
   - Needs careful synchronization in real chips
//------------------------------------------------------------------------------//
🔵 2. Synchronous Reset
✅ Reset happens only on clock edge. Works like normal data
        always @(posedge clk) begin
            if (rst)
                q <= 0;
            else
                q <= d;
        end
✅ Behaviour
    - Even if rst = 1, reset happens only at next clock edge
📊 Timeline idea:
clk :   ↑    ↑    ↑
rst :  ----1---------
q   :      waits → resets at next ↑
                       
✅ Advantages
    - No metastability issues (safer)
    - Easier for timing analysis + verification
    - Preferred in modern digital design
    - Used in most RTL designs
❌ Disadvantages
    - Needs clock → won’t reset if clock is not running
    - Slight delay in reset
//-------------------------------------------------------------------------------//
🧠 Interview-Level Insight 
   $ Industry often uses:
     - Async assert + Sync deassert
   $ Why?
     - Immediate reset needed
     - Safe release needed (avoid metastability)
🚀 Real-world usage
    ASIC/FPGA designs:
    - Prefer synchronous reset
    Low-level hardware / power circuits:
    - Use asynchronous reset
💡 Simple analogy
    - Asynchronous reset → Emergency brake (instant)
    - Synchronous reset → Normal brake (controlled with timing)
//-------------------------------------------------------------------------------//
